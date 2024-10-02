-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 28, 2024 lúc 10:27 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbtrangsuc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `status`, `created`) VALUES
(1, 'admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 0, 1641509311),
(4, 'Vũ Hoàng Việt', 'viethoang1607@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', 1, 0, 1723518439);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Trang sức', '', 0, 1, '2024-04-10 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2024-04-10 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2024-04-10 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2024-04-10 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2024-04-01 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '2024-04-10 09:49:15'),
(7, 'Trang sức nam', '', 1, 1, '2024-04-10 05:37:23'),
(8, 'Trang sức nữ', '', 1, 2, '2024-04-01 05:37:36'),
(10, 'Dây chuyền', '', 7, 1, '2024-04-10 09:49:15'),
(11, 'Vòng tay', '', 7, 2, '2024-04-11 09:49:15'),
(12, 'Nhẫn', '', 7, 3, '2024-04-11 09:49:15'),
(13, 'Khuyên tai', '', 7, 4, '2024-04-10 09:49:15'),
(14, 'Mặt dây chuyền', '', 7, 5, '2024-04-03 09:49:15'),
(15, 'Dây chuyền', '', 8, 1, '2024-04-10 09:49:15'),
(16, 'Bông tai', '', 8, 2, '2024-04-10 09:49:15'),
(17, 'lắc tay', '', 8, 3, '2024-04-09 09:49:15'),
(18, 'Nhẫn', '', 8, 4, '2024-04-16 09:49:15'),
(20, 'Lắc chân', '', 8, 5, '0000-00-00 00:00:00'),
(21, 'Mặt dây chuyền', '', 8, 6, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `product_id`, `content`, `image_link`, `rate`, `date`, `user_id`) VALUES
(1, 34, 'sản phẩm rất đẹp', 'Mat-day-chuyen_077892_1.jpg', 5, 1723515964, 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0,
  `size_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`, `size_id`) VALUES
(29, 24, 45, 1, 385000.00, 0, '01'),
(30, 24, 21, 1, 120000.00, 0, '01'),
(31, 25, 71, 1, 279000.00, 0, '01'),
(32, 26, 66, 1, 239000.00, 0, '01'),
(33, 26, 35, 1, 380000.00, 0, '01'),
(34, 27, 60, 1, 323000.00, 0, '01'),
(35, 28, 9, 1, 300000.00, 0, '02'),
(41, 34, 35, 1, 380000.00, 0, '05'),
(51, 38, 71, 1, 279000.00, 0, '01'),
(52, 38, 73, 2, 536000.00, 0, '01'),
(53, 39, 71, 1, 279000.00, 0, '01'),
(54, 39, 21, 1, 120000.00, 0, '01'),
(57, 42, 71, 1, 279000.00, 0, '01'),
(59, 1, 71, 1, 279000.00, 0, '01'),
(60, 1, 70, 1, 285000.00, 0, '01'),
(61, 2, 49, 1, 333000.00, 0, '01'),
(62, 2, 19, 1, 560000.00, 0, '01'),
(63, 3, 8, 1, 200000.00, 0, '01'),
(64, 3, 31, 1, 390000.00, 0, '01'),
(66, 5, 40, 1, 460000.00, 0, '05'),
(67, 6, 33, 1, 320000.00, 0, '05'),
(68, 6, 18, 1, 220000.00, 0, '01'),
(69, 7, 58, 1, 270000.00, 0, '01'),
(70, 8, 71, 1, 279000.00, 0, '01'),
(71, 9, 73, 1, 268000.00, 0, '01'),
(72, 9, 14, 1, 330000.00, 0, '01'),
(73, 10, 30, 1, 250000.00, 0, '01'),
(74, 10, 51, 1, 364000.00, 0, '01'),
(75, 11, 35, 1, 380000.00, 0, '01'),
(76, 11, 15, 1, 200000.00, 0, '01'),
(77, 12, 35, 1, 380000.00, 0, '01'),
(78, 13, 20, 1, 660000.00, 0, '05'),
(79, 14, 19, 1, 560000.00, 0, '03'),
(80, 14, 50, 1, 253000.00, 0, '01'),
(81, 15, 35, 1, 380000.00, 0, '05'),
(82, 15, 32, 1, 360000.00, 0, '01'),
(83, 16, 73, 1, 268000.00, 0, '01'),
(84, 16, 54, 1, 260000.00, 0, '01'),
(85, 17, 71, 1, 279000.00, 0, '01'),
(86, 17, 67, 1, 318000.00, 0, '01'),
(87, 18, 57, 1, 278000.00, 0, '01'),
(88, 18, 40, 1, 460000.00, 0, '01'),
(89, 19, 49, 1, 333000.00, 0, '01'),
(90, 19, 20, 1, 660000.00, 0, '01'),
(91, 20, 68, 1, 280000.00, 0, '01'),
(92, 20, 23, 1, 270000.00, 0, '01'),
(93, 21, 35, 1, 380000.00, 0, '05'),
(94, 21, 20, 1, 660000.00, 0, '01'),
(95, 22, 58, 1, 270000.00, 0, '01'),
(96, 22, 40, 1, 460000.00, 0, '01'),
(97, 23, 35, 1, 380000.00, 0, '05'),
(98, 23, 40, 1, 460000.00, 0, '01'),
(99, 24, 71, 1, 279000.00, 0, '01'),
(100, 24, 31, 1, 390000.00, 0, '01'),
(101, 25, 59, 1, 323000.00, 0, '05'),
(102, 26, 71, 1, 279000.00, 0, '01'),
(103, 26, 18, 1, 220000.00, 0, '05'),
(104, 27, 71, 1, 279000.00, 0, '01'),
(105, 28, 71, 1, 279000.00, 0, '01'),
(106, 29, 73, 1, 268000.00, 0, '01'),
(107, 29, 47, 1, 275000.00, 0, '01'),
(108, 29, 65, 1, 322000.00, 0, '01'),
(109, 30, 35, 1, 380000.00, 0, '05'),
(110, 30, 31, 1, 390000.00, 0, '01'),
(111, 30, 37, 1, 320000.00, 0, '01'),
(112, 31, 70, 1, 285000.00, 0, '01'),
(113, 31, 8, 1, 200000.00, 0, '01'),
(114, 32, 73, 1, 268000.00, 0, '01'),
(115, 32, 68, 1, 280000.00, 0, '01'),
(118, 34, 48, 1, 283000.00, 0, '01'),
(119, 34, 31, 1, 390000.00, 0, '01'),
(120, 35, 71, 1, 279000.00, 0, '01'),
(121, 35, 26, 1, 300000.00, 0, '01'),
(122, 36, 35, 1, 380000.00, 0, '05'),
(123, 36, 34, 1, 400000.00, 0, '01'),
(126, 38, 56, 1, 288000.00, 0, '01'),
(127, 38, 49, 1, 333000.00, 0, '01'),
(128, 39, 56, 1, 288000.00, 0, '01'),
(129, 39, 49, 1, 333000.00, 0, '01'),
(130, 40, 35, 1, 380000.00, 0, '05'),
(131, 40, 20, 1, 660000.00, 0, '01'),
(133, 42, 18, 1, 220000.00, 0, '05'),
(134, 42, 58, 1, 270000.00, 0, '01'),
(135, 44, 49, 1, 333000.00, 0, '01'),
(136, 44, 56, 1, 288000.00, 0, '01'),
(137, 44, 17, 1, 280000.00, 0, '01'),
(138, 45, 20, 1, 660000.00, 0, '05'),
(139, 45, 40, 1, 460000.00, 0, '01'),
(142, 47, 33, 1, 320000.00, 0, '05'),
(143, 47, 50, 1, 253000.00, 0, '01'),
(144, 48, 36, 1, 240000.00, 0, '05'),
(145, 48, 15, 1, 200000.00, 0, '01'),
(146, 49, 69, 1, 279000.00, 0, '01'),
(147, 49, 26, 1, 300000.00, 0, '01'),
(148, 49, 42, 1, 242000.00, 0, '01'),
(149, 50, 67, 1, 318000.00, 0, '02'),
(150, 50, 14, 1, 330000.00, 0, '01'),
(151, 50, 61, 1, 435000.00, 0, '01'),
(152, 51, 35, 1, 380000.00, 0, '05'),
(153, 51, 20, 1, 660000.00, 0, '01'),
(154, 51, 32, 1, 360000.00, 0, '01'),
(155, 51, 34, 1, 400000.00, 0, '01'),
(156, 52, 59, 1, 323000.00, 0, '05'),
(157, 52, 71, 1, 279000.00, 0, '01'),
(158, 53, 70, 1, 285000.00, 0, '01'),
(159, 53, 58, 1, 270000.00, 0, '01'),
(160, 54, 70, 1, 285000.00, 0, '01'),
(161, 55, 35, 1, 380000.00, 0, '05'),
(162, 56, 73, 1, 268000.00, 0, '01'),
(163, 57, 73, 1, 268000.00, 0, '01'),
(164, 58, 73, 1, 268000.00, 0, '01'),
(165, 59, 73, 1, 268000.00, 0, '01'),
(166, 60, 70, 1, 285000.00, 0, '01'),
(167, 61, 70, 1, 285000.00, 0, '01'),
(168, 62, 70, 1, 285000.00, 0, '01'),
(169, 63, 70, 1, 285000.00, 0, '01'),
(170, 64, 73, 10, 2680000.00, 0, '01'),
(171, 65, 73, 6, 1608000.00, 0, '02'),
(172, 66, 35, 2, 1908000.00, 0, '05'),
(173, 67, 35, 9, 8586000.00, 0, '06'),
(174, 68, 73, 2, 1136000.00, 0, '01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) NOT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(8, 18, 'Nhẫn Bạc Dạng Chuỗi Cách Điệu Gypsophila', '<p>Chiếc nhẫn được l&agrave;m từ bạc&nbsp;dạng chuỗi c&aacute;ch điệu Gypsophila với thiết kế to&aacute;t l&ecirc;n vẻ quyến rũ v&agrave; cuốn h&uacute;t cho ph&aacute;i đẹp, rất th&iacute;ch hợp với bạn khi đi chơi, xuống phố v&agrave; thậm ch&iacute; đi l&agrave;m nữa. H&atilde;y kết hợp với một bộ trang phục y&ecirc;u th&iacute;ch v&agrave; tự tin sải bước bạn nh&eacute;!</p>\r\n', 440000.00, 44000, 'nhan_696326_1.jpg', '[\"nhan_696326_21.jpg\",\"nhan_696326_31.jpg\",\"size_nh\\u1eabn.png\"]', 3, 2, 4, 1, 1722653898),
(9, 18, 'Bộ Nhẫn Bạc Nữ Dạng Mảnh Trơn Đơn Giản Flynn', '<p>Chiếc nhẫn được l&agrave;m từ bạc&nbsp;với thiết kế to&aacute;t l&ecirc;n vẻ quyến rũ v&agrave; cuốn h&uacute;t cho ph&aacute;i đẹp, rất th&iacute;ch hợp với bạn khi đi chơi, xuống phố v&agrave; thậm ch&iacute; đi l&agrave;m nữa. H&atilde;y kết hợp với một bộ trang phục y&ecirc;u th&iacute;ch v&agrave; tự tin sải bước bạn nh&eacute;!</p>\r\n', 459000.00, 45000, 'Nhan_626741_1.jpg', '[\"Nhan_626741_2.jpg\",\"size_nh\\u1eabn1.png\"]', 2, 1, 4, 1, 1722677169),
(10, 18, 'Nhẫn Hình Hồ Điệp Carwyn', '<p>Chiếc nhẫn được l&agrave;m từ bạc&nbsp; với điểm nhấn l&agrave; h&igrave;nh hồ điệp ở trung t&acirc;m, với thiết kế to&aacute;t l&ecirc;n vẻ quyến rũ v&agrave; cuốn h&uacute;t cho ph&aacute;i đẹp, rất th&iacute;ch hợp cho bạn khi đi chơi, xuống phố v&agrave; thậm ch&iacute; đi l&agrave;m nữa. H&atilde;y kết hợp với một bộ trang phục y&ecirc;u th&iacute;ch v&agrave; tự tin sải bước bạn nh&eacute;!</p>\r\n', 477000.00, 0, 'Nhan_135687_1.jpg', '[\"Nhan_135687_2.jpg\"]', 1, 0, 4, 1, 1722684424),
(11, 18, 'Nhẫn Chữ C Trơn Đơn Giản Dạng Xoắn Stephen', '<p>Chiếc nhẫn l&agrave; từ bạc S925 mang thiết kế v&ocirc; c&ugrave;ng thời trang v&agrave; phong c&aacute;ch sẽ l&agrave; sự lựa chọn ho&agrave;n hảo cho c&aacute;c c&ocirc; g&aacute;i c&aacute; t&iacute;nh, trẻ trung, ph&oacute;ng kho&aacute;ng. Chiếc nhẫn cao cấp n&agrave;y kết hợp với c&aacute; t&iacute;nh của bạn chắc chắn sẽ khiến bạn v&ocirc; c&ugrave;ng đặc biệt đấy!</p>\r\n', 460000.00, 23000, 'Nhan_572251_1.jpg', '[\"Nhan_572251_2.jpg\"]', 0, 0, 4, 1, 1722684591),
(12, 18, 'Nhẫn Bạc Nữ Dạng Mảnh Đính Đá CZ Hình Trái Tim', '<p>Chiếc nhẫn được l&agrave;m bằng bạc S925 mang phong c&aacute;ch thiết kế tượng trưng cho sự nữ t&iacute;nh, thanh lịch. Chắc hẳn bạn cũng như bất cứ c&ocirc; g&aacute;i n&agrave;o cũng muốn m&igrave;nh trở th&agrave;nh chủ nh&acirc;n của một chiếc nhẫn h&agrave;ng hiệu s&agrave;nh điệu v&agrave; sang trọng n&agrave;y để n&acirc;ng tầm đẳng cấp của m&igrave;nh v&agrave; khiến bao người ngưỡng mộ</p>\r\n', 513000.00, 0, 'Nhan_921998_1.jpg', '[\"Nhan_921998_2.jpg\",\"size_nh\\u1eabn2.png\"]', 1, 0, 4, 1, 1722684751),
(13, 18, 'Nhẫn Đính Đá CZ Hình Ngôi Sao 5 Cánh', '<p>Chiếc nhẫn bạc S925 đ&iacute;nh đ&aacute; Cubic Zirconia với thiết kế sẽ mang đến cho bạn sự trẻ trung, ph&oacute;ng kho&aacute;ng. D&ugrave; trong ho&agrave;n cảnh n&agrave;o: đi l&agrave;m, đi dự tiệc hay đi chơi với bạn b&egrave;, đ&ocirc;i tay của bạn sẽ cực kỳ nổi bật đấy!</p>\r\n', 520000.00, 52000, 'Nhan_715467_1.jpg', '[\"size_nh\\u1eabn3.png\"]', 0, -1, 4, 1, 1722684946),
(14, 18, 'Nhẫn Bạc Nữ Đính Đá CZ Hình Vô Cực Sloane', '<p>Chiếc nhẫn được l&agrave;m bằng bạc S925 đ&iacute;nh đ&aacute; Cubic Zirconia với thiết kế h&igrave;nh v&ocirc; cực mang đến cho bạn sự sang trọng v&agrave; qu&yacute; ph&aacute;i. D&ugrave; trong ho&agrave;n cảnh n&agrave;o: đi l&agrave;m, đi dự tiệc hay đi chơi với bạn b&egrave;, đ&ocirc;i tay của bạn sẽ cực kỳ nổi bật đấy!</p>\r\n', 538000.00, 0, 'Nhan_130966_1.jpg', '[\"Nhan_130966_2.jpg\",\"size_nh\\u1eabn4.png\"]', 0, 2, 4, 1, 1722685099),
(15, 12, 'Nhẫn Bạc Nam Tròn Trơn Ezequiel', '<p>Chiếc nhẫn được l&agrave;m từ bạc S925 với thiết kế mang đến cho bạn một vẻ đẹp ho&agrave;n hảo l&agrave; điểm nhấn nh&aacute; tuyệt vời mỗi khi bạn xuất hiện. Với sự tỉ mỉ trong từng đường n&eacute;t thiết kế, bạn sẽ trở n&ecirc;n ho&agrave;n hảo hơn khi đeo em n&oacute; đấy!</p>\r\n', 539000.00, 0, 'Nhan_095050_1.jpg', '[\"Nhan_095050_2.jpg\",\"size_nh\\u1eabn_nam.png\"]', 0, 1, 4, 1, 1722685341),
(16, 12, 'Nhẫn Bạc Nam Trơn Ahmed', '<p>Chiếc nhẫn l&agrave;m từ bạc S925 với thiết kế cho ph&eacute;p bạn s&aacute;ng tạo, mix match c&ugrave;ng những m&oacute;n trang sức cũng như trang phục kh&aacute;c nhau. D&ugrave; bạn kết hợp chiếc nhẫn n&agrave;y với trang phục n&agrave;o đi nữa th&igrave; đ&acirc;y cũng l&agrave; dấu ấn thật sự tuyệt vời cho bạn!</p>\r\n', 649000.00, 64000, 'Nhan_079490_1.jpg', '[\"Nhan_079490_2.jpg\",\"size_nh\\u1eabn_nam1.png\"]', 0, 0, 4, 1, 1722685567),
(17, 12, 'Nhẫn Bạc Nam Cá Tính Phong Cách Ryland', '<p>Chiếc nhẫn l&agrave;m từ bạc S925 với thiết kế cho ph&eacute;p bạn s&aacute;ng tạo, mix match c&ugrave;ng những m&oacute;n trang sức cũng như trang phục kh&aacute;c nhau. D&ugrave; bạn kết hợp chiếc nhẫn n&agrave;y với trang phục n&agrave;o đi nữa th&igrave; đ&acirc;y cũng l&agrave; dấu ấn thật sự tuyệt vời cho bạn!</p>\r\n', 654000.00, 0, 'Nhan_079507_1.jpg', '[\"Nhan_079507_2.jpg\"]', 0, -1, 4, 1, 1722685682),
(18, 12, 'Nhẫn Bạc Unisex Tròn Trơn Đơn Giản', '<p>Sản phẩm được l&agrave;m từ&nbsp;bạc, với vẻ ngo&agrave;i mang đến cho bạn kh&ocirc;ng chỉ sự đơn giản, thanh lịch m&agrave; c&ograve;n to&aacute;t l&ecirc;n vẻ tinh tế v&agrave; đẳng cấp thu h&uacute;t &aacute;nh nh&igrave;n ngay từ những gi&acirc;y ph&uacute;t đầu ti&ecirc;n. Sự hiện diện của nhẫn kh&ocirc;ng chỉ l&agrave; điểm nhấn nh&aacute;, thể hiện phong c&aacute;ch m&agrave; c&ograve;n &acirc;m thầm thể hiện thẩm mỹ v&agrave; đẳng cấp ri&ecirc;ng của bạn!</p>\r\n', 565000.00, 0, 'Nhan_194739_1.jpg', '[\"Nhan_194739_2.jpg\",\"size_nh\\u1eabn_nam2.png\"]', 1, 3, 4, 1, 1722685845),
(19, 12, 'Nhẫn Bạc Nam Đính Đá CZ Kaiden', '<p>Chiếc nhẫn được l&agrave;m từ bạc S925 đ&iacute;nh đ&aacute; Cubic Zirconia mang đến sự cuốn h&uacute;t to&aacute;t l&ecirc;n vẻ sang chảnh v&agrave; nổi bật cho bạn. Chắc chắn em n&oacute; sẽ l&agrave; một trong những items xứng đ&aacute;ng nhất trong tủ trang sức của bạn đ&oacute;!</p>\r\n', 769000.00, 0, 'Nhan_077248_1.jpg', '[\"Nhan_077248_2.jpg\",\"size_nh\\u1eabn_nam3.png\"]', 1, 1, 4, 1, 1722686032),
(20, 12, 'Nhẫn Bạc Nam Đính Đá CZ Ryker', '<p>Chiếc nhẫn l&agrave;m từ bạc S925 đ&iacute;nh đ&aacute; cz ryker&nbsp;sở hữu vẻ đẹp vừa qu&yacute; ph&aacute;i lại vừa hiện đại, cho ph&eacute;p bạn s&aacute;ng tạo, mix match c&ugrave;ng những m&oacute;n trang sức cũng như trang phục kh&aacute;c nhau, sẽ gi&uacute;p bạn nổi bật v&agrave; thu h&uacute;t mọi &aacute;nh nh&igrave;n d&ugrave; bạn xuất hiện ở đ&acirc;u, dạo phố, cafe, tiệc t&ugrave;ng hay đi l&agrave;m. Đừng ngạc nhi&ecirc;n khi nhiều &aacute;nh mắt hướng về bạn v&igrave; sự tinh tế n&agrave;y nh&eacute; !!</p>\r\n', 947000.00, 94000, 'Nhan_053636_1.jpg', '[\"Nhan_053636_2.jpg\",\"size_nh\\u1eabn_nam4.png\"]', 1, 6, 4, 1, 1722686332),
(21, 17, 'Lắc Tay Bạc Nữ Chỉ Đỏ Cỏ Bốn Lá May Mắn Kaitlyn', '<p>Lắc tay bằng bạc S925 được thiết kế đơn giản với h&igrave;nh ảnh cỏ bốn l&aacute; tượng trưng cho sự may mắn, hạnh ph&uacute;c v&agrave; t&agrave;i lộc được nổi bật tr&ecirc;n d&acirc;y đan bền chặt m&agrave;u đỏ mang lại một cảm gi&aacute;c trẻ trung, tạo n&ecirc;n vẻ đẹp thanh lịch v&agrave; tinh tế cho người đeo. Đ&acirc;y sẽ l&agrave; một m&oacute;n qu&agrave; &yacute; nghĩa v&agrave; đầy &yacute; nghĩa để tặng cho người th&acirc;n, bạn b&egrave; hoặc đồng nghiệp, đặc biệt l&agrave; trong c&aacute;c dịp đặc biệt như sinh nhật, lễ t&igrave;nh nh&acirc;n hay kỉ niệm.</p>\r\n', 340000.00, 0, 'Lac_063471_1.jpg', '[\"Lac_063471_2.jpg\",\"size_v\\u00f2ng_tay.png\"]', 0, 2, 4, 1, 1722686928),
(22, 17, 'Lắc Tay Bạc Nữ Dạng Mảnh Hình Trái Tim', '<p>Lắc tay được l&agrave;m từ bạc S925 mạ bạch kim với điểm nhấn l&agrave; tr&aacute;i tim xinh xắn ở trung t&acirc;m. Điểm kh&aacute;c biệt so với c&aacute;c sản phẩm kh&aacute;c đ&oacute; l&agrave; ng&ocirc;n ngữ của đ&aacute; được khai th&aacute;c tinh tế hơn với vị tr&iacute; xuất hiện đầy kh&eacute;o l&eacute;o. Chiếc v&ograve;ng tay xinh xắn n&agrave;y chắc chắn sẽ mang đến vẻ đẹp, sức h&uacute;t cho chủ nh&acirc;n của n&oacute; đ&oacute;!</p>\r\n', 429000.00, 0, 'Lac_626988_1.jpg', '[\"Lac_626988_2.jpg\"]', 0, 0, 4, 1, 1722688304),
(23, 17, 'Lắc Tay Bạc Nữ Trơn Mảnh Nhỏ Hạt Tròn Sarah', '<p>Chiếc lắc tay được l&agrave;m bằng bạc S925 với thiết kế mảnh nhỏ kết hợp với hạt tr&ograve;n mang đến cho bạn sự sang trọng v&agrave; qu&yacute; ph&aacute;i. D&ugrave; trong ho&agrave;n cảnh n&agrave;o: đi l&agrave;m, đi dự tiệc hay đi chơi với bạn b&egrave;, đ&ocirc;i tay của bạn sẽ cực kỳ nổi bật đấy!</p>\r\n', 523000.00, 52000, 'Lac_130510_1.jpg', '[\"Lac_130510_2.jpg\"]', 0, 1, 4, 1, 1722688427),
(24, 20, 'Lắc Chân Bạc Nữ Chuông Nhỏ Gabriela', '<p>Sản phẩm l&agrave;m từ bạc S925 được thiết kế đơn giản nhưng tinh tế, với những chi tiết nhỏ nhắn như c&aacute;c chu&ocirc;ng nhỏ treo lủng lẳng tạo ra &acirc;m thanh nhẹ nh&agrave;ng v&agrave; du dương mỗi khi bước ch&acirc;n di chuyển. Bạn c&oacute; thể th&ecirc;m điểm nhấn đ&aacute;ng y&ecirc;u v&agrave; nữ t&iacute;nh cho trang phục của m&igrave;nh, từ v&aacute;y m&ugrave;a h&egrave; nhẹ nh&agrave;ng đến quần jeans c&aacute; t&iacute;nh. Sản phẩm n&agrave;y sẽ l&agrave; một m&oacute;n qu&agrave; tuyệt vời để tặng người th&acirc;n y&ecirc;u hoặc bạn b&egrave; trong những dịp đặc biệt đ&oacute;!&nbsp;</p>\r\n', 427000.00, 0, 'Lac_070151_1.jpg', '[\"Lac_070151_2.jpg\",\"size_l\\u1eafc_ch\\u00e2n.png\"]', 2, 0, 4, 1, 1722688922),
(25, 20, 'Lắc Chân Bạc Nữ Dạng Chuỗi Hạt Tròn', '<p>Chiếc lắc được l&agrave;m từ bạc S925 mang đến cho bạn một vẻ đẹp ho&agrave;n hảo l&agrave; điểm nhấn nh&aacute; tuyệt vời mỗi khi bạn xuất hiện. B&ecirc;n cạnh đ&oacute;, với m&oacute;n nữ trang n&agrave;y, bạn c&ograve;n c&oacute; thể s&aacute;ng tạo, mix-match c&ugrave;ng những m&oacute;n trang sức kh&aacute;c nhau để tạo n&ecirc;n phong c&aacute;ch của ri&ecirc;ng m&igrave;nh, gi&uacute;p bạn tự tin v&agrave; tỏa s&aacute;ng.</p>\r\n', 535000.00, 0, 'Lac_911185_1.jpg', '[\"size_l\\u1eafc_ch\\u00e2n1.png\"]', 1, 0, 4, 1, 1722689100),
(26, 17, 'Lắc Tay Bạc Nữ Dạng Dây Xù Leighton', '<p>Chiếc lắc được l&agrave;m từ bạc dạng d&acirc;y x&ugrave; được thiết kế c&oacute; thể chuyển động lắc lư theo nhịp bước ch&acirc;n to&aacute;t l&ecirc;n vẻ quyến rũ v&agrave; cuốn h&uacute;t cho ph&aacute;i đẹp. Chiếc lắc th&iacute;ch hợp với bạn g&aacute;i khi đi chơi, xuống phố v&agrave; thậm ch&iacute; đi l&agrave;m nữa. H&atilde;y kết hợp với một bộ trang phục y&ecirc;u th&iacute;ch v&agrave; tự tin sải bước bạn nh&eacute;. Đặc biệt, việc lựa chọn qu&agrave; tặng bằng những m&oacute;n đồ trang sức n&agrave;y sẽ khiến người th&acirc;n y&ecirc;u của bạn thực sự th&iacute;ch th&uacute; v&agrave; cảm thấy m&igrave;nh được quan t&acirc;m.</p>\r\n', 539000.00, 53000, 'Lac_053158_1.jpg', '[\"Lac_053158_2.jpg\",\"size_v\\u00f2ng_tay1.png\"]', 0, 2, 4, 1, 1722689403),
(27, 16, 'Bông Tai Bạc Nữ Đính Đá CZ, Ngọc Trai Fidelma', '<p>Chiếc b&ocirc;ng tai được l&agrave;m bằng bạc S925 đ&iacute;nh đ&aacute; Cubic Zirconia, ngọc trai cao cấp. Kho&aacute;c l&ecirc;n m&igrave;nh thiết kế bất đối xứng độc đ&aacute;o, mang đến vẻ đẹp ki&ecirc;u kỳ, c&aacute; t&iacute;nh v&agrave; sự trẻ trung cho c&ocirc; n&agrave;ng sở hữu. Đ&acirc;y cũng l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa m&agrave; ph&aacute;i mạnh c&oacute; thể d&agrave;nh cho ph&aacute;i đẹp như thể hiện sự n&acirc;ng niu, tr&acirc;n trọng, v&agrave; bảo vệ người phụ nữ m&igrave;nh y&ecirc;u.</p>\r\n', 570000.00, 57000, 'Bong-tai_285761_1.jpg', '[\"Bong-tai_285761_2.jpg\"]', 2, 0, 4, 1, 1722689547),
(28, 16, 'Khuyên Xỏ Tai Helix Lobe Conch', '<p>Chiếc khuy&ecirc;n xỏ l&agrave; unisex n&ecirc;n d&ugrave; bạn l&agrave; nữ hay nam d&ugrave;ng em n&oacute; đều okila nh&eacute;. Em n&oacute; sẽ gi&uacute;p c&aacute;c bạn nữ th&ecirc;m phần đ&aacute;ng y&ecirc;u v&agrave; c&aacute; t&iacute;nh đ&oacute;, c&ograve;n c&aacute;c bạn nam sẽ th&ecirc;m phần điển trai v&agrave; cool ngầu nha. Khuy&ecirc;n xỏ 965964 được l&agrave;m từ bạc&nbsp;mạ Rhodium, đ&iacute;nh đ&aacute; Cubic Zirconia cao cấp, chế t&aacute;c tỉ mỉ bởi c&aacute;c nghệ nh&acirc;n l&agrave;nh nghề, l&agrave; một trong những mẫu khuy&ecirc;n mũi, m&ocirc;i, tai helix lobe conch&hellip; đẹp nhất hiện nay. C&ugrave;ng ra ngo&agrave;i v&agrave; tỏa s&aacute;ng với em n&oacute; nh&eacute; !!</p>\r\n', 420000.00, 0, 'Khuyen-xo_965964_1.jpg', '[\"Khuyen-xo_965964_2.jpg\"]', 0, 0, 4, 1, 1722737582),
(29, 15, 'Dây Chuyền Bạc Nữ Đính Đá CZ Cá Tiên', '<p>Bạn sẽ kh&ocirc;ng chỉ th&ecirc;m phần xinh xắn v&agrave; thanh lịch khi diện em d&acirc;y chuyền bạc với thiết kế c&aacute; ti&ecirc;n độc đ&aacute;o n&agrave;y, m&agrave; c&ograve;n thể hiện gu thẩm mỹ rất ri&ecirc;ng đấy nh&eacute;. H&atilde;y tưởng tượng bạn sẽ duy&ecirc;n d&aacute;ng v&agrave; thu h&uacute;t l&agrave;m sao khi bạn diện chiếc v&ograve;ng cổ n&agrave;y đi l&agrave;m, đi hẹn h&ograve; hay đi chơi với bạn b&egrave;. Em n&oacute; được l&agrave;m từ bạc 925 chuy&ecirc;n dụng , điểm nhấn bởi những vi&ecirc;n đ&aacute; Cubic Zirconia cao cấp v&agrave; được chế t&aacute;c hết sức tỉ mỉ bởi những nghệ nh&acirc;n l&agrave;nh nghề. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; tỏa s&aacute;ng th&ocirc;i n&agrave;o !!</p>\r\n', 817000.00, 0, 'Day-chuyen-bac_831944_1.jpg', '[\"Day-chuyen-bac_831944_2.jpg\",\"size_d\\u00e2y_chuy\\u1ec1n.png\"]', 1, 0, 4, 1, 1722737787),
(30, 14, 'Mặt Dây Chuyền Hình Hoa Văn Joziah', '<p>Mặt d&acirc;y chuyền được chế t&aacute;c từ bạc với thiết kế mới lạ v&agrave; đầy t&iacute;nh s&aacute;ng tạo. Em n&oacute; sẽ gi&uacute;p bạn nổi bật v&agrave; thu h&uacute;t mọi &aacute;nh nh&igrave;n d&ugrave; bạn xuất hiện ở đ&acirc;u, dạo phố, cafe, tiệc t&ugrave;ng hay đi l&agrave;m. Đừng ngạc nhi&ecirc;n khi nhiều &aacute;nh mắt hướng về bạn v&igrave; sự tinh tế n&agrave;y nh&eacute; !!</p>\r\n', 420000.00, 0, 'Mat-day-chuyen_080177_1.jpg', '[]', 0, 1, 4, 1, 1722737908),
(31, 17, 'Lắc Tay Bạc Nữ Đính Đá CZ Cỏ 4 Lá', '<p>Chiếc lắc được l&agrave;m từ bạc&nbsp;đ&iacute;nh 2 vi&ecirc;n đ&aacute; Cubic Zirconia được chế t&aacute;c tỉ mỉ. Với thiết kế h&igrave;nh cỏ bốn l&aacute; thống nhất khoe trọn vẻ đẹp nữ t&iacute;nh, rạng rỡ của người đeo n&ecirc;n thường được ph&aacute;i mạnh sử dụng l&agrave;m m&oacute;n qu&agrave; bất ngờ v&agrave; v&ocirc; c&ugrave;ng &yacute; nghĩa cho n&agrave;ng như lời gửi gắm, truyền tải những t&acirc;m tư v&agrave; t&igrave;nh cảm ch&acirc;n th&agrave;nh d&agrave;nh cho n&agrave;ng.</p>\r\n', 816000.00, 40000, 'Lac-tay_612672_1.jpg', '[\"Lac-tay_612672_2.jpg\"]', 0, 4, 4, 1, 1722738134),
(32, 10, 'Dây Chuyền Bạc Nam Hình Nhẫn Đôi Ngôi Sao', '<p>D&acirc;y chuyền được l&agrave;m từ bạc&nbsp;kết hợp với thiết kế nhẫn đ&ocirc;i tinh tế kh&ocirc;ng chỉ thể hiện sự mới mẻ, c&aacute; t&iacute;nh m&agrave; c&ograve;n chứng minh t&igrave;nh y&ecirc;u đ&ocirc;i lứa tuyệt đẹp. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; thể hiện t&igrave;nh y&ecirc;u của bạn th&ocirc;i n&agrave;o !!</p>\r\n', 908000.00, 0, 'Day-chuyen_078653_1.jpg', '[\"Day-chuyen_078653_2.jpg\",\"size_d\\u00e2y_chuy\\u1ec1n1.png\"]', 0, 1, 4, 1, 1722738299),
(33, 10, 'Dây Chuyền Đính Đá CZ Nhẫn Kèm Ngôi Sao 6 Cánh Scott', '<p>D&acirc;y chuyền được l&agrave;m từ bạc&nbsp;kết hợp với thiết kế nhẫn k&egrave;m ng&ocirc;i sao 6 c&aacute;nh thể hiện sự mới lạ, c&aacute; t&iacute;nh v&agrave; rất c&oacute; gu. Em n&oacute; rất dễ phối đồ n&ecirc;n d&ugrave; bạn đi l&agrave;m, đi chơi hay đi hẹn h&ograve; đều hợp. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; thể hiện c&aacute; t&iacute;nh của bạn th&ocirc;i n&agrave;o !!</p>\r\n', 920000.00, 92000, 'Day-chuyen_078646_1.jpg', '[\"Day-chuyen_078646_2.jpg\",\"size_d\\u00e2y_chuy\\u1ec1n2.png\"]', 1, 2, 4, 1, 1722738628),
(34, 14, 'Mặt Dây Chuyền Bạc Thái Nam Đồng Hồ Ma Thuật Cesar', '<p>Mặt d&acirc;y chuyền được chế t&aacute;c từ bạc Th&aacute;i, thể hiện sự bền bỉ v&agrave; chất lượng xuất sắc. Kết hợp với thiết kế đồng hồ ma thuật tạo n&ecirc;n n&eacute;t c&aacute; t&iacute;nh v&agrave; ph&aacute; c&aacute;ch của người đeo. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; thể hiện c&aacute; t&iacute;nh ri&ecirc;ng của m&igrave;nh ngay th&ocirc;i n&agrave;o !</p>\r\n\r\n<p>Lưu &yacute;: Chỉ gồm mặt d&acirc;y chuyền, kh&ocirc;ng gồm d&acirc;y đeo</p>\r\n', 673000.00, 0, 'Mat-day-chuyen_077892_1.jpg', '[\"Mat-day-chuyen_077892_2.jpg\"]', 2, 2, 9, 2, 1722738777),
(35, 11, 'Lắc Tay Bạc Nam Mắt Xích Đơn Giản', '<p>Một thiết kế đơn giản m&agrave; thanh lịch, mang đến cho bạn sự tinh tế m&agrave; c&aacute; t&iacute;nh. Lắc tay bạc 746785 được l&agrave;m từ bạc với thiết kế dạng mắt x&iacute;ch, l&agrave; một trong những mẫu lắc tay cho nam đẹp nhất hiện nay, được chế t&aacute;c tỉ mỉ v&agrave; c&ocirc;ng phu bởi những nghệ nh&acirc;n l&agrave;nh nghề. Bạn sẽ cool hơn với em n&oacute; đấy !!</p>\r\n\r\n<p>Độ rộng mặt d&acirc;y: 8 mm</p>\r\n', 1060000.00, 106000, 'Lac-tay-bac_746785_1.jpg', '[\"Lac-tay-bac_746785_2.jpg\",\"size_v\\u00f2ng_tay2.png\"]', 2, 22, 4, 1, 1722739002),
(36, 11, 'Vòng Tay Bạc Nam Dây Bện 6 Ký Tự Chú Chosen', '<p>Chiếc lắc được l&agrave;m từ bạc&nbsp;kết hợp với d&acirc;y bện kết hợp với 6 k&yacute; tự ch&uacute; tạo n&ecirc;n phong c&aacute;ch sang trọng v&agrave; tinh tế cho ph&aacute;i mạnh, gi&uacute;p ch&agrave;ng lu&ocirc;n cảm thấy tự tin thể hiện bản th&acirc;n. Sự hiện diện của lắc kh&ocirc;ng chỉ l&agrave; điểm nhấn nh&aacute;, kh&ocirc;ng những thể hiện phong c&aacute;ch nam t&iacute;nh m&agrave; c&ograve;n &acirc;m thầm thể hiện thẩm mỹ, phong c&aacute;ch v&agrave; đẳng cấp ri&ecirc;ng của bạn!</p>\r\n', 587000.00, 58000, 'Lac-tay_103661_1.jpg', '[\"Lac-tay_103661_2.jpg\"]', 0, 1, 4, 1, 1722739220),
(37, 13, 'Bông Tai Tròn Họa Tiết Bellamy', '<p>B&ocirc;ng tai được l&agrave;m từ bằng bạc&nbsp;kết hợp với thiết kế tỉ mỉ, chi tiết trong từng đường n&eacute;t để t&ocirc;n vinh vẻ đẹp cho bạn. Chắc chắn chiếc b&ocirc;ng tai n&agrave;y sẽ l&agrave; một trong những items xứng đ&aacute;ng nhất trong tủ trang sức của bạn đ&oacute;. C&ugrave;ng ra ngo&agrave;i v&agrave; tỏa s&aacute;ng c&ugrave;ng em n&oacute; th&ocirc;i n&agrave;o !!</p>\r\n', 571000.00, 57000, 'Bong-tai_078419_1.jpg', '[\"Bong-tai_078419_2.jpg\"]', 0, 1, 4, 1, 1722739387),
(38, 13, 'Khuyên Tai Nam Dẹt', '<p>Bạn đang t&igrave;m kiếm chiếc b&ocirc;ng tai cho nam, đẹp, tinh tế v&agrave; c&aacute; t&iacute;nh? B&ocirc;ng tai dẹt 885842 được thiết kế nhằm thỏa m&atilde;n y&ecirc;u cầu đ&oacute;. Chiếc b&ocirc;ng tai vừa mang đến cho bạn phong c&aacute;ch vừa kh&aacute; dễ phối đồ. Sản phẩm được l&agrave;m từ bạc 92.5% nguy&ecirc;n chất, được chế t&aacute;c tỉ mỉ v&agrave; c&ocirc;ng phu bởi những nghệ nh&acirc;n l&agrave;nh nghề. Bạn sẽ th&ecirc;m phần điển trai với em n&oacute; đấy !!</p>\r\n', 320000.00, 0, 'Bong-tai_885842_1.jpg', '[\"Bong-tai_885842_2.jpg\"]', 0, 0, 4, 1, 1722739629),
(39, 10, 'Dây Chuyền Đôi Đính Đá CZ', '<p>Một trong số những thiết kế trang sức đ&ocirc;i tuyệt vời, d&acirc;y chuyền cặp đ&ocirc;i 528145 được l&agrave;m từ bạc&nbsp;đ&iacute;nh đ&aacute; Cubic Zirconia cao cấp. Với thiết kế lấy cảm hứng từ biển cả, tượng trưng cho một t&igrave;nh y&ecirc;u vĩnh cửu, d&acirc;y chuyền đ&ocirc;i n&agrave;y l&agrave; sự lựa chọn tuyệt vời cho những cặp đ&ocirc;i đang y&ecirc;u nhau như một m&oacute;n kỷ vật theo c&aacute;c bạn đi c&ugrave;ng năm th&aacute;ng, c&ugrave;ng t&igrave;nh y&ecirc;u d&agrave;i l&acirc;u. Em n&oacute; cũng c&oacute; thể l&agrave; m&oacute;n qu&agrave; tuyệt vời m&agrave; ch&agrave;ng hay n&agrave;ng d&agrave;nh cho nhau. C&aacute;c bạn tr&ocirc;ng sẽ thật hạnh ph&uacute;c v&agrave; tỏa s&aacute;ng đ&oacute; !!</p>\r\n', 1598000.00, 159000, 'Day-chuyen-doi_528145_1.jpg', '[\"Day-chuyen-doi_528145_2.jpg\"]', 1, 0, 4, 1, 1722739837),
(40, 11, 'Lắc Tay Bạc Nam Barrett', '<p>Chiếc lắc được l&agrave;m từ bạc S925, với thiết kế v&ocirc; c&ugrave;ng thời trang v&agrave; phong c&aacute;ch, mang đến cho bạn một vẻ đẹp ho&agrave;n hảo l&agrave; điểm nhấn nh&aacute; tuyệt vời mỗi khi bạn xuất hiện. B&ecirc;n cạnh đ&oacute;, bạn c&ograve;n c&oacute; thể s&aacute;ng tạo, mix-match c&ugrave;ng những m&oacute;n trang sức kh&aacute;c nhau để tạo n&ecirc;n phong c&aacute;ch của ri&ecirc;ng m&igrave;nh, gi&uacute;p bạn tự tin v&agrave; tỏa s&aacute;ng.</p>\r\n', 1410000.00, 0, 'Lac-tay_076555_1.jpg', '[\"Lac-tay_076555_2.jpg\"]', 1, 5, 4, 1, 1722740185),
(42, 21, 'Mặt Dây Chuyền Bạc Nữ Pha Lê Trắng Hình Giọt Nước', '<p>Bạn sẽ th&ecirc;m phần xinh xắn v&agrave; thanh lịch khi diện em d&acirc;y chuyền bạc đ&iacute;nh pha l&ecirc; giọt nước n&agrave;y đấy. H&atilde;y tưởng tượng bạn sẽ duy&ecirc;n d&aacute;ng v&agrave; thu h&uacute;t l&agrave;m sao khi bạn diện chiếc v&ograve;ng cổ n&agrave;y đi l&agrave;m, đi hẹn h&ograve; hay đi chơi với bạn b&egrave;. Mặt d&acirc;y chuyền bạc nữ pha l&ecirc; trắng h&igrave;nh giọt nước 929931 được l&agrave;m từ bạc 925 chuy&ecirc;n dụng mạ v&agrave;ng, điểm nhấn bởi vi&ecirc;n pha l&ecirc; trắng cao cấp v&agrave; được chế t&aacute;c hết sức tỉ mỉ bởi những nghệ nh&acirc;n l&agrave;nh nghề. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; tỏa s&aacute;ng th&ocirc;i n&agrave;o !!</p>\r\n\r\n<p>Lưu &yacute;: Chỉ gồm mặt d&acirc;y chuyền, kh&ocirc;ng gồm d&acirc;y đeo</p>\r\n', 1042000.00, 0, 'Mat-day-chuyen_929931_1.jpg', '[\"Mat-day-chuyen_929931_2.jpg\"]', 1, 1, 4, 1, 1722740493),
(43, 20, 'Lắc Chân Bạc Nữ Đính Đá CZ Hình Cỏ 4 Lá Mildred', '<p>Chiếc lắc được l&agrave;m từ bạc S925 đ&iacute;nh đ&aacute; Cubic Zirconia cao cấp h&igrave;nh cỏ 4 l&aacute; mang đến cho bạn sự tinh tế v&agrave; thanh tho&aacute;t mỗi khi ra ngo&agrave;i. C&ograve;n g&igrave; tuyệt hơn c&ugrave;ng em n&oacute; đi cafe, dạo phố, đi l&agrave;m, chắc chắn nhiều ch&agrave;ng sẽ để &yacute; lắm đ&oacute; !!</p>\r\n', 811000.00, 40000, 'Lac-chan_763298_1.jpg', '[\"Lac-chan_763298_2.jpg\",\"size_l\\u1eafc_ch\\u00e2n2.png\"]', 0, 0, 4, 1, 1722740649),
(44, 11, 'Lắc Tay Nam Dạng Chuỗi Hoa Văn Remy', '<p>Chiếc lắc được l&agrave;m từ bạc, với thiết kế tạo n&ecirc;n phong c&aacute;ch sang trọng v&agrave; tinh tế cho ph&aacute;i mạnh, gi&uacute;p ch&agrave;ng lu&ocirc;n cảm thấy tự tin thể hiện bản th&acirc;n. Sự hiện diện của lắc kh&ocirc;ng chỉ l&agrave; điểm nhấn nh&aacute;, kh&ocirc;ng những thể hiện phong c&aacute;ch nam t&iacute;nh m&agrave; c&ograve;n &acirc;m thầm thể hiện thẩm mỹ, phong c&aacute;ch v&agrave; đẳng cấp ri&ecirc;ng của bạn!</p>\r\n', 967000.00, 48000, 'Lac-tay_078088_1.jpg', '[\"Lac-tay_078088_2.jpg\",\"size_v\\u00f2ng_tay3.png\"]', 1, 0, 4, 1, 1722740867),
(45, 15, 'Dây Chuyền Trái Tim Đại Dương', '<p>D&acirc;y chuyền&nbsp;tr&aacute;i tim đại dương 295787 l&agrave; một thiết kế v&ocirc; c&ugrave;ng sang trọng v&agrave; hấp dẫn. H&atilde;y tưởng tượng vi&ecirc;n pha l&ecirc; đ&iacute;nh tr&ecirc;n d&acirc;y chuyền bạc n&agrave;y s&aacute;ng lấp l&aacute;nh tr&ecirc;n khu&ocirc;n cổ của bạn, sẽ thật tuyệt vời đ&uacute;ng kh&ocirc;ng n&agrave;o. M&oacute;n trang sức n&agrave;y sẽ gi&uacute;p bạn th&ecirc;m đ&aacute;ng y&ecirc;u v&agrave; thu h&uacute;t đ&oacute;. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; tỏa s&aacute;ng th&ocirc;i n&agrave;o !!</p>\r\n', 785000.00, 0, 'day-chuyen_295787_1.jpg', '[\"day-chuyen_295787_2.jpg\"]', 0, 1, 4, 1, 1722741094),
(46, 15, 'Dây Chuyền Đính Đá CZ Dạng Nhẫn Đôi', '<p>Chiếc d&acirc;y chuyền được l&agrave;m từ bạc đ&iacute;nh đ&aacute; Cubic Zirconia với thiết kế dạng nhẫn đ&ocirc;i xinh xắn mang đến vẻ quyến rũ v&agrave; cuốn h&uacute;t cho ph&aacute;i đẹp, rất th&iacute;ch hợp với bạn khi đi chơi, xuống phố v&agrave; thậm ch&iacute; đi l&agrave;m nữa. H&atilde;y kết hợp với một bộ trang phục y&ecirc;u th&iacute;ch v&agrave; tự tin sải bước bạn nh&eacute;!</p>\r\n', 782000.00, 0, 'Day-chuyen_748855_1.jpg', '[]', 0, 0, 4, 1, 1722741218),
(47, 16, 'Bông Tai Bạc Nữ Đính Đá CZ Mèo Và Mặt Trăng', '<p>Chiếc b&ocirc;ng tai được l&agrave;m bằng bạc&nbsp;đ&iacute;nh đ&aacute; Cubic Zirconia với thiết kế h&igrave;nh m&egrave;o nhỏ v&agrave; mặt trăng mang đến cho bạn sự sang trọng v&agrave; qu&yacute; ph&aacute;i. D&ugrave; trong ho&agrave;n cảnh n&agrave;o: đi l&agrave;m, đi dự tiệc hay đi chơi với bạn b&egrave;, đ&ocirc;i tai của bạn sẽ cực kỳ nổi bật đấy!</p>\r\n', 475000.00, 0, 'Bong-tai_107046_1.jpg', '[\"Bong-tai_107046_2.jpg\"]', 0, 1, 4, 1, 1722741368),
(48, 16, 'Bông Tai Bạc Nữ Đính Đá CZ Bông Tuyết', '<p>Bạn sẽ kh&ocirc;ng chỉ th&ecirc;m phần xinh xắn v&agrave; thanh lịch khi diện em b&ocirc;ng tai b&ocirc;ng tuyết n&agrave;y, m&agrave; c&ograve;n thể hiện sự sang trọng v&agrave; gu thẩm mỹ rất ri&ecirc;ng đ&oacute;. H&atilde;y tưởng tượng bạn sẽ duy&ecirc;n d&aacute;ng v&agrave; thu h&uacute;t l&agrave;m sao khi bạn diện chiếc khuy&ecirc;n tai n&agrave;y đi l&agrave;m, đi hẹn h&ograve; hay đi chơi với bạn b&egrave;. B&ocirc;ng tai bạc nữ b&ocirc;ng tuyết đ&iacute;nh đ&aacute; CZ 236916 được l&agrave;m từ bạc&nbsp;chuy&ecirc;n dụng, điểm nhấn bởi vi&ecirc;n đ&aacute;&nbsp;<strong>Cubic Zirconia</strong>&nbsp;cao cấp v&agrave; được chế t&aacute;c hết sức tỉ mỉ bởi những nghệ nh&acirc;n l&agrave;nh nghề. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; tỏa s&aacute;ng th&ocirc;i n&agrave;o !!</p>\r\n', 483000.00, 0, 'Bong-tai_236916_1.jpg', '[\"Bong-tai_236916_2.jpg\"]', 1, 1, 4, 1, 1722741503),
(49, 14, 'Mặt Dây Chuyền Nam Mario', '<p>Mặt d&acirc;y chuyền được l&agrave;m từ bạc&nbsp;chuy&ecirc;n dụng kết hợp với thiết kế nh&acirc;n vật Mario độc đ&aacute;o, s&aacute;ng tạo thể hiện phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh ri&ecirc;ng của người đeo. Bạn sẽ th&ecirc;m phần điển trai khi đeo em n&oacute; đấy! C&ugrave;ng em n&oacute; ra ngo&agrave;i ngay th&ocirc;i n&agrave;o!</p>\r\n\r\n<p>K&iacute;ch thước: D&agrave;i 3,7 cm x Rộng 2,4 cm</p>\r\n\r\n<p>Lưu &yacute;: Chỉ gồm mặt d&acirc;y chuyền, kh&ocirc;ng gồm d&acirc;y đeo</p>\r\n', 533000.00, 0, 'Mat-day-chuyen-Mario_076153_1.jpg', '[\"Mat-day-chuyen-Mario_076153_2.jpg\"]', 0, 5, 4, 1, 1722741751),
(50, 13, 'Khuyên Tai Bạc Nam Tròn Gregory', '<p>Chiếc khuy&ecirc;n tai được l&agrave;m từ bạc&nbsp;với thiết kế mang đến cho bạn một vẻ đẹp ho&agrave;n hảo l&agrave; điểm nhấn nh&aacute; tuyệt vời mỗi khi bạn xuất hiện. Với sự tỉ mỉ trong từng đường n&eacute;t thiết kế, bạn sẽ trở n&ecirc;n ho&agrave;n hảo hơn khi đeo em n&oacute; đấy!</p>\r\n', 458000.00, 0, 'Khuyen-tai_095222_1.jpg', '[\"Khuyen-tai_095222_2.jpg\"]', 0, 2, 4, 1, 1722741890),
(51, 10, 'Dây Chuyền Bạc Nam Bện Xoắn', '<p>Bạn đang t&igrave;m kiếm chiếc d&acirc;y chuyền cho nam, đẹp, tinh tế v&agrave; c&aacute; t&iacute;nh? D&acirc;y chuyền bạc Th&aacute;i nam bện xoắn to nhỏ 694567 được thiết kế nhằm thỏa m&atilde;n y&ecirc;u cầu đ&oacute;. Chiếc mặt d&acirc;y chuyền vừa mang đến cho bạn phong c&aacute;ch vừa kh&aacute; dễ phối đồ. Sản phẩm được l&agrave;m từ bạc, được chế t&aacute;c tỉ mỉ v&agrave; c&ocirc;ng phu bởi những nghệ nh&acirc;n l&agrave;nh nghề. C&oacute; 2 size nhỏ (1.5mm), to hơn (3 mm) cho bạn lựa chọn. Bạn sẽ th&ecirc;m phần điển trai với em n&oacute; đấy !!</p>\r\n', 864000.00, 0, 'Day-chuyen_694567_1.jpg', '[\"Day-chuyen_694567_2.jpg\"]', 1, 0, 4, 1, 1722742101),
(52, 15, 'Dây Chuyền Đôi Bạc Đính Đá CZ Gắn Nam Châm Heart To Heart', '<p>Nếu bạn đang t&igrave;m kiếm một mẫu trang sức trang sức đẹp, tinh tế cho cặp đ&ocirc;i th&igrave; d&acirc;y chuyền đ&ocirc;i bạc Heart to Heart 558997 ho&agrave;n to&agrave;n thỏa m&atilde;n điều đ&oacute;. D&acirc;y chuyền l&agrave;m từ bạc đ&iacute;nh đ&aacute; Cubic Zirconia cao cấp, chia l&agrave;m hai nửa tr&aacute;i tim của đ&ocirc;i trai g&aacute;i, được gắn kết với nhau bằng cặp nam ch&acirc;m tr&aacute;i cực, với hy vọng t&igrave;nh y&ecirc;u đ&ocirc;i lứa sẽ lu&ocirc;n đẹp, m&atilde;i bền chặt, đi c&ugrave;ng nhau đến cuối con đường. Ch&uacute;c c&aacute;c bạn hạnh ph&uacute;c nh&eacute; !!</p>\r\n', 1410000.00, 70000, 'Day-chuyen_558997_1.jpg', '[\"Day-chuyen_558997_2.jpg\",\"Day-chuyen_558997_3.jpg\"]', 0, 0, 4, 1, 1722742219),
(53, 15, 'Dây Chuyền Bạc Nữ Đính Đá Aurora Mèo Nhỏ Và Mặt Trăng', '<p>Bạn sẽ kh&ocirc;ng chỉ th&ecirc;m phần xinh xắn v&agrave; thanh lịch khi diện em d&acirc;y chuyền m&egrave;o nhỏ mặt trăng Moonstone n&agrave;y, m&agrave; c&ograve;n thể hiện gu thẩm mỹ rất ri&ecirc;ng đấy nh&eacute;. H&atilde;y tưởng tượng bạn sẽ duy&ecirc;n d&aacute;ng v&agrave; thu h&uacute;t l&agrave;m sao khi bạn diện chiếc v&ograve;ng cổ n&agrave;y đi l&agrave;m, đi hẹn h&ograve; hay đi chơi với bạn b&egrave;. D&acirc;y chuyền bạc nữ m&egrave;o nhỏ v&agrave; mặt trăng đ&iacute;nh đ&aacute; Aurora 328547 được l&agrave;m từ bạc&nbsp;chuy&ecirc;n dụng, điểm nhấn bởi vi&ecirc;n đ&aacute; mặt trăng cao cấp v&agrave; được chế t&aacute;c hết sức tỉ mỉ bởi những nghệ nh&acirc;n l&agrave;nh nghề. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; tỏa s&aacute;ng th&ocirc;i n&agrave;o !!</p>\r\n', 806000.00, 0, 'Day-chuyen-bac_328547_1.jpg', '[\"Day-chuyen-bac_328547_2.jpg\"]', 0, 0, 4, 1, 1722742391),
(54, 15, 'Dây Chuyền Bạc Nữ Dạng Trơn Hình Chiếc Lá', '<p>Chiếc d&acirc;y chuyền được l&agrave;m từ bạc&nbsp;với thiết kế h&igrave;nh chiếc l&aacute; c&aacute;ch điệu tượng trưng cho sự nữ t&iacute;nh, thanh lịch. Chắc hẳn bạn cũng như bất cứ c&ocirc; g&aacute;i n&agrave;o cũng muốn m&igrave;nh trở th&agrave;nh chủ nh&acirc;n của một chiếc v&ograve;ng cổ h&agrave;ng hiệu s&agrave;nh điệu v&agrave; sang trọng n&agrave;y để n&acirc;ng tầm đẳng cấp của m&igrave;nh v&agrave; khiến bao người ngưỡng mộ.</p>\r\n', 535000.00, 0, 'Day-chuyen_572315_1.jpg', '[\"Day-chuyen_572315_2.jpg\"]', 0, 1, 4, 1, 1722742556),
(55, 20, 'Lắc Chân Bạc Nữ Dạng Kiềng Gắn Chuông Tròn', '<p>Chiếc v&ograve;ng được l&agrave;m từ bạc, dạng kiềng, t&ocirc; điểm bởi chiếc chu&ocirc;ng c&ugrave;ng 2 ch&uacute; c&aacute; xinh xắn ở trung t&acirc;m, mang đến cho bạn một vẻ đẹp ho&agrave;n hảo l&agrave; điểm nhấn nh&aacute; tuyệt vời mỗi khi bạn xuất hiện. B&ecirc;n cạnh đ&oacute;, với m&oacute;n nữ trang n&agrave;y, bạn c&ograve;n c&oacute; thể s&aacute;ng tạo, mix-match c&ugrave;ng những m&oacute;n trang sức kh&aacute;c nhau để tạo n&ecirc;n phong c&aacute;ch của ri&ecirc;ng m&igrave;nh, gi&uacute;p bạn tự tin v&agrave; tỏa s&aacute;ng.</p>\r\n', 823000.00, 0, 'Vong-chan_696363_1.jpg', '[\"Vong-chan_696363_2.jpg\"]', 1, 0, 4, 1, 1722742854),
(56, 14, 'Mặt Dây Chuyền Bạc Nam Hình Gấu Teddy', '<p>Sản phẩm được chế t&aacute;c từ bạc, thể hiện sự bền bỉ v&agrave; chất lượng xuất sắc. Kết hợp với h&igrave;nh gấu teddy tạo n&ecirc;n n&eacute;t c&aacute; t&iacute;nh v&agrave; ph&aacute; c&aacute;ch của người đeo. C&ugrave;ng em n&oacute; ra ngo&agrave;i v&agrave; thể hiện c&aacute; t&iacute;nh ri&ecirc;ng của m&igrave;nh ngay th&ocirc;i n&agrave;o !</p>\r\n\r\n<p>Lưu &yacute;: Chỉ gồm mặt d&acirc;y chuyền, kh&ocirc;ng gồm d&acirc;y đeo</p>\r\n', 518000.00, 0, 'Mat-day-chuyen_073640_1.jpg', '[\"Mat-day-chuyen-Mario_076153_21.jpg\"]', 0, 3, 4, 1, 1722743223),
(57, 14, 'Mặt Dây Chuyền Nam Túi Tiền May Mắn', '<p>Chiếc mặt d&acirc;y chuyền được chế t&aacute;c bằng bạc, với thiết kế t&uacute;i tiền may mắn tinh tế v&ocirc; c&ugrave;ng ph&ugrave; hợp với những ch&agrave;ng trai mạnh mẽ, c&aacute; t&iacute;nh. Với thiết kế độc đ&aacute;o n&agrave;y bạn chắc chắn sẽ muốn đeo em n&oacute; mọi l&uacute;c mọi nơi đ&oacute;!</p>\r\n\r\n<p>Lưu &yacute;: Chỉ gồm mặt d&acirc;y chuyền, kh&ocirc;ng gồm d&acirc;y đeo</p>\r\n', 428000.00, 0, 'Mat-day-chuyen_076944_1.jpg', '[\"Mat-day-chuyen_076944_2.jpg\"]', 1, 1, 4, 1, 1722743397),
(58, 14, 'Mặt Dây Chuyền Nam Hình Lon Coca-Cola Độc Đáo ', '<p>Bạn sẽ tr&ocirc;ng c&aacute; t&iacute;nh v&agrave; co gu thẩm mỹ rất ri&ecirc;ng khi đeo chiếc mặt d&acirc;y chuyền h&igrave;nh lon coca-cola n&agrave;y. Mặt d&acirc;y chuyền được l&agrave;m từ bạc, được chế t&aacute;c tỉ mỉ bởi những nghệ nh&acirc;n l&agrave;nh nghề. Sở hữu chiếc mặt d&acirc;y chuyền v&agrave; cool ngầu c&ugrave;ng n&oacute; th&ocirc;i n&agrave;o !!</p>\r\n\r\n<p>Lưu &yacute;: Chỉ gồm mặt d&acirc;y chuyền, kh&ocirc;ng gồm d&acirc;y đeo</p>\r\n', 410000.00, 20000, 'Mat-day-chuyen_077289_1.jpg', '[\"Mat-day-chuyen_077289_2.jpg\"]', 1, 4, 4, 1, 1722743562),
(59, 10, 'Dây Chuyền Bạc Nam Beauty And Beast', '<p>Một trong số những thiết kế trang sức đ&ocirc;i tuyệt vời, d&acirc;y chuyền cặp đ&ocirc;i 971219 được l&agrave;m từ bạc. D&acirc;y chuyền đ&ocirc;i n&agrave;y l&agrave; sự lựa chọn tuyệt vời cho những cặp đ&ocirc;i đang y&ecirc;u nhau như một m&oacute;n kỷ vật theo c&aacute;c bạn đi c&ugrave;ng năm th&aacute;ng, c&ugrave;ng t&igrave;nh y&ecirc;u d&agrave;i l&acirc;u. Em n&oacute; cũng c&oacute; thể l&agrave; m&oacute;n qu&agrave; tuyệt vời m&agrave; ch&agrave;ng hay n&agrave;ng d&agrave;nh cho nhau. C&aacute;c bạn tr&ocirc;ng sẽ thật hạnh ph&uacute;c v&agrave; tỏa s&aacute;ng đ&oacute; !!</p>\r\n', 923000.00, 0, 'day-chuyen_971219_1.jpg', '[\"day-chuyen_971219_2.jpg\"]', 2, 2, 4, 1, 1722743806),
(60, 15, 'Dây Chuyền Bạc Nữ Beauty And Beast ', '<p>Một trong số những thiết kế trang sức đ&ocirc;i tuyệt vời, d&acirc;y chuyền cặp đ&ocirc;i 971219 được l&agrave;m từ bạc. D&acirc;y chuyền đ&ocirc;i n&agrave;y l&agrave; sự lựa chọn tuyệt vời cho những cặp đ&ocirc;i đang y&ecirc;u nhau như một m&oacute;n kỷ vật theo c&aacute;c bạn đi c&ugrave;ng năm th&aacute;ng, c&ugrave;ng t&igrave;nh y&ecirc;u d&agrave;i l&acirc;u. Em n&oacute; cũng c&oacute; thể l&agrave; m&oacute;n qu&agrave; tuyệt vời m&agrave; ch&agrave;ng hay n&agrave;ng d&agrave;nh cho nhau. C&aacute;c bạn tr&ocirc;ng sẽ thật hạnh ph&uacute;c v&agrave; tỏa s&aacute;ng đ&oacute; !!</p>\r\n', 923000.00, 0, 'day-chuyen-bac_971219_3.jpg', '[\"day-chuyen_971219_21.jpg\"]', 0, 1, 4, 1, 1722743918),
(61, 15, 'Dây Chuyền Bạc Nữ 2 Tầng Đẹp Và Độc Hình Đôi Bướm', '<h1>D&acirc;y Chuyền Bạc Nữ 2 Tầng Đẹp V&agrave; Độc H&igrave;nh Đ&ocirc;i Bướm</h1>\r\n', 855000.00, 85000, 'Day-chuyen-bac_361718_1.jpg', '[\"Day-chuyen-bac_361718_2.jpg\"]', 1, 1, 4, 1, 1722744088),
(62, 20, 'Lắc Chân Bạc Nữ Hình Mèo Gắn Chuông', '<p>Một thiết kế trong s&aacute;ng, đơn giản nhưng lại rất ưa nh&igrave;n. Em n&oacute; lấy cảm hứng từ ch&uacute; m&egrave;o dễ thương, rất đ&aacute;ng y&ecirc;u phải kh&ocirc;ng n&agrave;o. Lắc ch&acirc;n được l&agrave;m từ bạc, l&agrave; một trong những mẫu lắc ch&acirc;n nữ đẹp nhất hiện nay. Đ&ocirc;i khi sự giản đơn lại mang đến sức h&uacute;t đến k&igrave; lạ, em n&oacute; sẽ gi&uacute;p bạn c&oacute; th&ecirc;m sự tinh thế, thanh lịch nhưng cũng kh&ocirc;ng k&eacute;m phần sang trọng !!</p>\r\n', 611000.00, 0, 'Lac-chan_363819_1.jpg', '[\"Lac-chan_363819_2.jpg\"]', 0, 0, 4, 1, 1722744326),
(63, 20, 'Lắc Chân Bạc Nữ Dạng Chuỗi Mảnh Hình Trái Tim ', '<p>Chiếc lắc được l&agrave;m từ bạc mang đến cho bạn một vẻ đẹp ho&agrave;n hảo l&agrave; điểm nhấn nh&aacute; tuyệt vời mỗi khi bạn xuất hiện. B&ecirc;n cạnh đ&oacute;, với m&oacute;n nữ trang n&agrave;y, bạn c&ograve;n c&oacute; thể s&aacute;ng tạo, mix-match c&ugrave;ng những m&oacute;n trang sức kh&aacute;c nhau để tạo n&ecirc;n phong c&aacute;ch của ri&ecirc;ng m&igrave;nh, gi&uacute;p bạn tự tin v&agrave; tỏa s&aacute;ng.</p>\r\n', 601000.00, 0, 'Lac-chan-bac_442423_1.jpg', '[]', 1, 0, 4, 1, 1722744450),
(64, 20, 'Lắc Chân Bạc Nữ Dạng Mảnh Nhỏ Hình Chuông Tròn', '<p>Chiếc lắc được l&agrave;m từ bạc&nbsp;với thiết kế dạng mảnh nhỏ h&igrave;nh chuỗi hạt, đan xen v&agrave;o sự độc đ&aacute;o l&agrave; một ch&uacute;t dịu d&agrave;ng khi c&oacute; điểm nhấn những chiếc chu&ocirc;ng xinh xắn, mang đến vẻ đẹp vừa dịu d&agrave;ng lại vừa năng động. D&ugrave; bạn kết hợp chiếc v&ograve;ng xinh xắn n&agrave;y với trang phục n&agrave;o đi nữa th&igrave; đ&acirc;y cũng l&agrave; dấu ấn thật sự tuyệt vời cho bạn!</p>\r\n', 695000.00, 69000, 'Lac-chan-bac_346614_1.jpg', '[\"Lac-chan-bac_346614_2.jpg\"]', 1, 0, 4, 1, 1722744592),
(65, 20, 'Lắc Chân Bạc Nữ Đính Đá CZ Hình Trái Tim Clementine', '<p>Chiếc lắc được l&agrave;m bằng bạc&nbsp;đ&iacute;nh đ&aacute; Cubic Zirconia với thiết kế h&igrave;nh tr&aacute;i tim mang đến cho bạn sự trang nh&atilde; v&agrave; thanh lịch. Bạn đ&atilde; sẵn s&agrave;ng để tỏa s&aacute;ng v&agrave; thu h&uacute;t mọi &aacute;nh nh&igrave;n c&ugrave;ng em n&oacute; chưa n&agrave;o !!</p>\r\n', 642000.00, 0, 'Lac-chan_104669_1.jpg', '[\"Lac-chan_104669_2.jpg\"]', 2, 1, 4, 1, 1722744726),
(66, 18, 'Nhẫn Bạc Nữ Dạng Trái Tim Lồng Nhau Cleopatra', '<p>Chiếc nhẫn được chế t&aacute;c từ bạc S925 mang thiết kế v&ocirc; c&ugrave;ng thời trang v&agrave; phong c&aacute;ch sẽ l&agrave; sự lựa chọn ho&agrave;n hảo cho c&aacute;c c&ocirc; g&aacute;i c&aacute; t&iacute;nh, trẻ trung, ph&oacute;ng kho&aacute;ng. Chiếc nhẫn cao cấp n&agrave;y kết hợp với c&aacute; t&iacute;nh của bạn chắc chắn sẽ khiến bạn v&ocirc; c&ugrave;ng đặc biệt đấy!</p>\r\n', 489000.00, 0, 'Nhan-bac_114593_1.jpg', '[\"Nhan-bac_114593_2.jpg\",\"size_nh\\u1eabn5.png\"]', 2, 1, 4, 1, 1722744921),
(67, 17, 'Lắc Tay Bạc Nữ Đính Đá CZ Hình Vỏ Sò Celina', '<p>Chiếc lắc được l&agrave;m từ bạc, với phong c&aacute;ch thiết kế nhấn nh&aacute;, nhỏ xinh, vừa dịu d&agrave;ng vừa thu h&uacute;t được chế t&aacute;c tinh xảo từ đường n&eacute;t mảnh mai, tao nh&atilde; đến vi&ecirc;n đ&aacute; Cubic Zirconia cao cấp được đ&iacute;nh kh&eacute;o l&eacute;o gi&uacute;p t&ocirc; điểm cho ph&aacute;i đẹp. Chắc chắn em n&oacute; sẽ l&agrave; 1 trong những items xứng đ&aacute;ng nhất của bạn đ&oacute;!</p>\r\n', 618000.00, 0, 'Lac-tay_319267_1.jpg', '[\"Lac-tay_319267_2.jpg\"]', 1, 1, 4, 1, 1722745121),
(68, 16, 'Bông Tai Bạc Nữ Hình Ngôi Sao 5 Cánh Ash', '<p>Chiếc b&ocirc;ng tai được chế t&aacute;c bằng bạc với thiết kế h&igrave;nh ng&ocirc;i sao 5 c&aacute;nh mang đến cho bạn một vẻ đẹp ho&agrave;n hảo l&agrave; điểm nhấn nh&aacute; tuyệt vời mỗi khi bạn xuất hiện. B&ecirc;n cạnh đ&oacute;, bạn c&ograve;n c&oacute; thể s&aacute;ng tạo, mix-match c&ugrave;ng những m&oacute;n trang sức kh&aacute;c nhau để tạo n&ecirc;n phong c&aacute;ch của ri&ecirc;ng m&igrave;nh, gi&uacute;p bạn tự tin v&agrave; tỏa s&aacute;ng.</p>\r\n', 487000.00, 0, 'Bong-tai_101063_1.jpg', '[\"Bong-tai_101063_2.jpg\"]', 3, 2, 4, 1, 1722745287),
(69, 16, 'Bông Tai Bạc Nữ Hình Cỏ 4 Lá Lorraine', '<p>Chiếc b&ocirc;ng tai được chế t&aacute;c từ bạc với thiết kế h&igrave;nh cỏ 4 l&aacute; mang đến n&eacute;t thanh lịch đầy cuốn h&uacute;t cho bạn. Với sự tỉ mỉ trong từng đường n&eacute;t thiết kế, bạn sẽ trở n&ecirc;n ho&agrave;n hảo hơn khi đeo em n&oacute; đấy!</p>\r\n', 460000.00, 0, 'Bong-tai-bac_102802_1.jpg', '[\"Bong-tai-bac_102802_2.jpg\"]', 4, 0, 4, 1, 1722745473),
(71, 16, 'Bông Tai Bạc Nữ Hình Ngôi Sao 5 Cánh Eloise', '<p>Chiếc b&ocirc;ng tai được chế t&aacute;c từ bạc&nbsp;với thiết kế h&igrave;nh ng&ocirc;i sao 5 c&aacute;nh mang đến n&eacute;t thanh lịch đầy cuốn h&uacute;t cho bạn. Với sự tỉ mỉ trong từng đường n&eacute;t thiết kế, bạn sẽ trở n&ecirc;n ho&agrave;n hảo hơn khi đeo em n&oacute; đấy!</p>\r\n', 482000.00, 48000, 'Bong-tai-bac_102644_1.jpg', '[\"Bong-tai-bac_102644_2.jpg\"]', 5, 12, 4, 1, 1722745808),
(73, 21, 'Mặt Dây Chuyền Chuột Mickey', '<p>Bạn sẽ tr&ocirc;ng rất c&aacute; t&iacute;nh v&agrave; co gu thẩm mỹ rất ri&ecirc;ng khi đeo chiếc mặt d&acirc;y chuyền chuột Mickey n&agrave;y. Đ&acirc;y kh&ocirc;ng chỉ l&agrave; một thiết kế rất độc v&agrave; đẹp&nbsp;m&agrave; c&ograve;n mang đến vẻ đẹp l&ocirc;i cuốn v&agrave; tinh thần trẻ trung cho cả nam v&agrave; nữ. Mặt d&acirc;y chuyền bạc nữ/nam chuột Mickey được l&agrave;m từ bạc, được chế t&aacute;c tỉ mỉ bởi những nghệ nh&acirc;n l&agrave;nh nghề. Sở hữu chiếc mặt d&acirc;y chuyền v&agrave; tỏa s&aacute;ng c&ugrave;ng n&oacute; th&ocirc;i n&agrave;o !!</p>\r\n\r\n<p>Lưu &yacute;: Chỉ gồm mặt d&acirc;y chuyền, kh&ocirc;ng gồm d&acirc;y đeo</p>\r\n', 568000.00, 0, 'Mat-da-chuyen_073630_3.jpg', '[\"Mat-day-chuyen_073630_2.jpg\"]', 9, 28, 4, 1, 1722916097);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `id_province` int(11) NOT NULL,
  `id_district` int(11) NOT NULL,
  `name_province` varchar(200) NOT NULL,
  `name_district` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `id_province`, `id_district`, `name_province`, `name_district`) VALUES
(1, 'GHN-Giao Hàng Nhanh', 260, 2206, 'Hà Nội', 'Huyện Thường Tín');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizedetail`
--

CREATE TABLE `sizedetail` (
  `id` int(11) NOT NULL,
  `product_id` int(255) NOT NULL,
  `size_id` varchar(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sizedetail`
--

INSERT INTO `sizedetail` (`id`, `product_id`, `size_id`, `quantity`) VALUES
(4, 6, '04', 10),
(5, 7, '04', 10),
(10, 2, '02', 10),
(76, 27, '01', 10),
(77, 28, '01', 10),
(81, 30, '01', 9),
(91, 34, '01', 8),
(95, 36, '06', 10),
(96, 36, '05', 9),
(97, 37, '01', 12),
(98, 38, '01', 10),
(102, 40, '06', 10),
(103, 40, '05', 9),
(105, 42, '01', 9),
(112, 45, '03', 11),
(113, 45, '02', 11),
(115, 46, '03', 11),
(116, 46, '02', 11),
(117, 47, '01', 10),
(118, 48, '01', 10),
(119, 49, '01', 7),
(120, 50, '01', 10),
(130, 54, '02', 11),
(131, 54, '01', 11),
(135, 56, '01', 8),
(136, 57, '01', 10),
(137, 58, '01', 9),
(138, 59, '06', 11),
(139, 59, '05', 9),
(140, 60, '02', 11),
(141, 60, '01', 11),
(142, 61, '03', 11),
(143, 61, '02', 11),
(144, 62, '03', 11),
(145, 62, '02', 11),
(146, 63, '03', 11),
(147, 63, '02', 11),
(148, 64, '03', 11),
(156, 67, '03', 10),
(157, 67, '02', 9),
(158, 68, '01', 8),
(165, 69, '01', 11),
(167, 64, '01', 13),
(169, 66, '02', 10),
(170, 66, '01', 10),
(171, 65, '02', 10),
(172, 65, '01', 10),
(173, 55, '02', 10),
(174, 55, '01', 12),
(175, 52, '03', 10),
(176, 52, '02', 10),
(177, 72, '01', 10),
(178, 53, '02', 10),
(179, 53, '01', 10),
(180, 43, '02', 10),
(181, 43, '01', 10),
(182, 44, '06', 10),
(183, 44, '05', 10),
(184, 51, '06', 10),
(185, 51, '05', 10),
(186, 39, '02', 10),
(187, 39, '01', 10),
(188, 35, '06', 1),
(189, 35, '05', 18),
(190, 33, '06', 10),
(191, 33, '05', 8),
(192, 32, '06', 10),
(193, 32, '05', 10),
(194, 31, '03', 10),
(195, 31, '01', 7),
(196, 29, '02', 10),
(197, 29, '01', 10),
(198, 26, '02', 10),
(199, 26, '01', 8),
(200, 25, '02', 10),
(201, 25, '01', 10),
(202, 24, '02', 10),
(203, 24, '01', 10),
(204, 23, '02', 10),
(205, 23, '01', 9),
(206, 21, '02', 10),
(207, 21, '01', 9),
(208, 20, '06', 10),
(209, 20, '05', 8),
(210, 19, '06', 10),
(211, 19, '05', 10),
(212, 18, '06', 10),
(213, 18, '05', 8),
(214, 17, '06', 10),
(215, 17, '05', 10),
(216, 16, '06', 10),
(217, 16, '05', 10),
(218, 15, '06', 10),
(219, 15, '05', 10),
(220, 8, '02', 10),
(221, 8, '01', 8),
(222, 9, '02', 10),
(223, 9, '01', 11),
(224, 10, '02', 10),
(225, 10, '01', 10),
(226, 14, '02', 10),
(227, 14, '01', 8),
(228, 13, '02', 10),
(229, 13, '01', 10),
(230, 12, '02', 10),
(231, 12, '01', 10),
(232, 11, '02', 10),
(233, 11, '01', 10),
(238, 51, '04', 1),
(239, 17, '03', 1),
(240, 15, '03', 1),
(241, 32, '04', 1),
(245, 73, '03', 5),
(247, 73, '02', 10),
(248, 73, '01', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` varchar(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `name`) VALUES
('01', 'Size 5'),
('02', 'Size 6'),
('03', 'Size 7'),
('04', 'Size 8'),
('05', 'Size 9'),
('06', 'Size 10'),
('07', 'Size 11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', '2.png', 'http://localhost/Shopbantrangsuc/trang-suc-nam-c7', 1, '2022-01-02 15:24:43'),
(2, '2', '1.png', 'http://localhost/Shopbantrangsuc/trang-suc-nu-c8', 2, '2022-01-02 15:36:41'),
(3, '3', '3.png', 'http://localhost/Shopbantrangsuc/khuyen-mai', 3, '2022-01-02 13:47:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `user_phone` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `date`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(1, 3, 10, 'Lê Thị Huyền Trang', '2023-01-06 18:02:26', '0326262412', 'Hà Nội, Quận Cầu Giấy, Phường Nghĩa Tân - Hà Nội', ' Phí Ship: 0VNĐ', 564000.00, 'Thanh toán khi nhận hàng', 1673002933),
(2, 3, 5, 'Nguyễn Hoàng Nam', '2023-01-06 18:02:26', '0321976412', 'Hà Nội, Quận Bắc Từ Liêm, Phường Thụy Phương - Hà Nội', ' Phí Ship: 0VNĐ', 893000.00, 'Thanh toán khi nhận hàng', 1673694265),
(3, 3, 10, 'Lê Thị Huyền Trang', '2023-03-11 18:05:54', '0326262412', 'Hà Nội, Quận Cầu Giấy, Phường Nghĩa Tân - Hà Nội', ' Phí Ship: 0VNĐ', 590000.00, 'Thanh toán khi nhận hàng', 1678532744),
(5, 3, 7, 'Lê Đức Trí', '2023-03-19 08:49:46', '0357684287', 'Hà Nội, Huyện Gia Lâm, Xã Phú Thị - Hà Nội', ' Phí Ship: 0VNĐ', 460000.00, 'Thanh toán khi nhận hàng', 1679190575),
(6, 3, 1, 'Vũ Hoàng Việt', '2023-04-04 08:52:15', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 540000.00, 'Thanh toán khi nhận hàng', 1680573123),
(7, 4, 1, 'Vũ Hoàng Việt', '2023-04-19 08:55:17', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 270000.00, 'Thanh toán khi nhận hàng', 1681869302),
(8, 3, 12, 'Đào Phương Ly', '2023-04-25 09:46:41', '0337614852', 'Hà Nội, Huyện Thường Tín, Xã Vân Tảo - Hà Nội', ' Phí Ship: 0VNĐ', 279000.00, 'Thanh toán khi nhận hàng', 1682390793),
(9, 3, 12, 'Đào Phương Ly', '2023-05-07 09:48:11', '0337614852', 'Hà Nội, Huyện Thường Tín, Xã Vân Tảo - Hà Nội', ' Phí Ship: 0VNĐ', 598000.00, 'Thanh toán khi nhận hàng', 1683427679),
(10, 3, 6, 'Đặng Đức Thuần', '2023-05-18 09:49:39', '0321986414', 'Hà Nội, Huyện Phú Xuyên, Xã Nam Tiến - Hà Nội', ' Phí Ship: 0VNĐ', 614000.00, 'Thanh toán khi nhận hàng', 1684378169),
(11, 3, 8, 'Lê Hoàng Vũ', '2023-06-09 09:51:07', '0321986415', 'Hà Nội, Quận Nam Từ Liêm, Phường Xuân Phương - Hà Nội', ' Phí Ship: 0VNĐ', 580000.00, 'Thanh toán khi nhận hàng', 1686279059),
(12, 3, 1, 'Vũ Hoàng Việt', '2023-06-20 09:52:05', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 380000.00, 'Thanh toán khi nhận hàng', 1687229516),
(13, 4, 5, 'Nguyễn Hoàng Nam', '2023-07-07 09:53:13', '0321976412', 'Hà Nội, Quận Bắc Từ Liêm, Phường Thụy Phương - Hà Nội', ' Phí Ship: 0VNĐ', 660000.00, 'Thanh toán khi nhận hàng', 1688698388),
(14, 3, 5, 'Nguyễn Hoàng Nam', '2023-07-07 09:54:06', '0321976412', 'Hà Nội, Quận Bắc Từ Liêm, Phường Thụy Phương - Hà Nội', ' Phí Ship: 0VNĐ', 813000.00, 'Thanh toán khi nhận hàng', 1688698436),
(15, 3, 4, 'Nguyễn Vũ Đăng', '2023-08-06 09:55:41', '0321986785', 'Hà Nội, Huyện Quốc Oai, Xã Tân Phú - Hà Nội', ' Phí Ship: 0VNĐ', 740000.00, 'Thanh toán khi nhận hàng', 1691290531),
(16, 3, 13, 'Trần Minh Châu', '2023-09-10 09:56:26', '0343576179', 'Hà Nội, Thị xã Sơn Tây, Xã Kim Sơn - Hà Nội', ' Phí Ship: 0VNĐ', 528000.00, 'Thanh toán khi nhận hàng', 1694314577),
(17, 3, 14, 'Hoàng Thị Diễm Hằng', '2023-09-15 09:58:17', '0324617399', 'Hà Nội, Huyện Đông Anh, Xã Xuân Nộn - Hà Nội', ' Phí Ship: 0VNĐ', 597000.00, 'Thanh toán khi nhận hàng', 1694746678),
(18, 3, 6, 'Đặng Đức Thuần', '2023-10-18 09:59:36', '0321986414', 'Hà Nội, Huyện Phú Xuyên, Xã Nam Tiến - Hà Nội', ' Phí Ship: 0VNĐ', 738000.00, 'Thanh toán khi nhận hàng', 1697597965),
(19, 3, 1, 'Vũ Hoàng Việt', '2023-10-29 10:00:33', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 993000.00, 'Thanh toán khi nhận hàng', 1698548424),
(20, 3, 11, 'Trần Mỹ Hạnh', '2023-11-05 10:01:37', '0324725412', 'Hà Nội, Huyện Mê Linh, Xã Tiến Thắng - Hà Nội', ' Phí Ship: 0VNĐ', 550000.00, 'Thanh toán khi nhận hàng', 1699153289),
(21, 3, 15, 'Hoàng Văn Long', '2023-12-08 10:05:14', '0459864282', 'Hà Nội, Huyện Phúc Thọ, Xã Xuân Phú - Hà Nội', ' Phí Ship: 0VNĐ', 1040000.00, 'Thanh toán khi nhận hàng', 1702004704),
(22, 3, 7, 'Lê Đức Trí', '2024-01-07 10:08:59', '0357684287', 'Hà Nội, Huyện Gia Lâm, Xã Phú Thị - Hà Nội', ' Phí Ship: 0VNĐ', 730000.00, 'Thanh toán khi nhận hàng', 1704596921),
(23, 3, 8, 'Lê Hoàng Vũ', '2024-01-18 10:12:24', '0321986415', 'Hà Nội, Quận Nam Từ Liêm, Phường Xuân Phương - Hà Nội', ' Phí Ship: 0VNĐ', 840000.00, 'Thanh toán khi nhận hàng', 1705547534),
(24, 3, 16, 'Trần Mỹ Linh', '2024-02-03 10:17:20', '0321842688', 'Hà Nội, Huyện Gia Lâm, Xã Yên Thường - Hà Nội', ' Phí Ship: 0VNĐ', 669000.00, 'Thanh toán khi nhận hàng', 1706930220),
(25, 3, 16, 'Trần Mỹ Linh', '2024-02-14 10:20:09', '0321842688', 'Hà Nội, Huyện Gia Lâm, Xã Yên Thường - Hà Nội', ' Phí Ship: 0VNĐ', 323000.00, 'Thanh toán khi nhận hàng', 1707880793),
(26, 3, 13, 'Trần Minh Châu', '2024-03-09 10:22:56', '0343576179', 'Hà Nội, Thị xã Sơn Tây, Xã Kim Sơn - Hà Nội', ' Phí Ship: 0VNĐ', 499000.00, 'Thanh toán khi nhận hàng', 1709954555),
(27, 4, 12, 'Đào Phương Ly', '2024-04-08 10:26:41', '0337614852', 'Hà Nội, Huyện Thường Tín, Xã Vân Tảo - Hà Nội', ' Phí Ship: 0VNĐ', 279000.00, 'Thanh toán khi nhận hàng', 1712546795),
(28, 3, 12, 'Đào Phương Ly', '2024-04-09 10:27:45', '0337614852', 'Hà Nội, Huyện Thường Tín, Xã Vân Tảo - Hà Nội', ' Phí Ship: 0VNĐ', 279000.00, 'Thanh toán khi nhận hàng', 1712633243),
(29, 3, 14, 'Hoàng Thị Diễm Hằng', '2024-04-18 10:29:32', '0324617399', 'Hà Nội, Huyện Đông Anh, Xã Xuân Nộn - Hà Nội', ' Phí Ship: 0VNĐ', 865000.00, 'Thanh toán khi nhận hàng', 1713410960),
(30, 3, 6, 'Đặng Đức Thuần', '2024-04-29 10:30:59', '0321986414', 'Hà Nội, Huyện Phú Xuyên, Xã Nam Tiến - Hà Nội', ' Phí Ship: 0VNĐ', 1090000.00, 'Thanh toán khi nhận hàng', 1714361448),
(31, 3, 10, 'Lê Thị Huyền Trang', '2024-05-11 10:33:26', '0326262412', 'Hà Nội, Quận Cầu Giấy, Phường Nghĩa Tân - Hà Nội', ' Phí Ship: 0VNĐ', 485000.00, 'Thanh toán khi nhận hàng', 1715398397),
(32, 3, 9, 'Lê Thị Nga', '2024-05-20 10:39:32', '0338546899', 'Hà Nội, Quận Nam Từ Liêm, Phường Xuân Phương - Hà Nội', ' Phí Ship: 0VNĐ', 548000.00, 'Thanh toán khi nhận hàng', 1716176350),
(34, 3, 9, 'Lê Thị Nga', '2024-06-07 10:44:13', '0338546899', 'Hà Nội, Quận Nam Từ Liêm, Phường Xuân Phương - Hà Nội', ' Phí Ship: 0VNĐ', 673000.00, 'Thanh toán khi nhận hàng', 1717731842),
(35, 3, 14, 'Hoàng Thị Diễm Hằng', '2024-06-30 10:47:34', '0324617399', 'Hà Nội, Huyện Đông Anh, Xã Xuân Nộn - Hà Nội', ' Phí Ship: 0VNĐ', 579000.00, 'Thanh toán khi nhận hàng', 1719719236),
(36, 3, 4, 'Nguyễn Vũ Đăng', '2024-07-01 10:48:43', '0321986785', 'Hà Nội, Huyện Quốc Oai, Xã Tân Phú - Hà Nội', ' Phí Ship: 0VNĐ', 780000.00, 'Thanh toán khi nhận hàng', 1719805713),
(38, 4, 5, 'Nguyễn Hoàng Nam', '2024-07-13 10:50:21', '0321976412', 'Hà Nội, Quận Bắc Từ Liêm, Phường Thụy Phương - Hà Nội', ' Phí Ship: 0VNĐ', 621000.00, 'Thanh toán khi nhận hàng', 1720842611),
(39, 3, 18, 'Lê Đức Gia Huy', '2024-07-14 10:52:32', '0321246498', 'Hà Nội, Quận Bắc Từ Liên, Phường Cổ Nhuế 1 - Hà Nội', ' Phí Ship: 0VNĐ', 621000.00, 'Thanh toán khi nhận hàng', 1720929141),
(40, 3, 5, 'Nguyễn Hoàng Nam', '2024-07-19 10:53:42', '0321976412', 'Hà Nội, Quận Bắc Từ Liêm, Phường Thụy Phương - Hà Nội', ' Phí Ship: 0VNĐ', 1040000.00, 'Thanh toán khi nhận hàng', 1721361211),
(42, 4, 7, 'Lê Đức Trí', '2024-07-22 10:55:46', '0357684287', 'Hà Nội, Huyện Gia Lâm, Xã Phú Thị - Hà Nội', ' Phí Ship: 0VNĐ', 490000.00, 'Thanh toán khi nhận hàng', 1721620519),
(44, 3, 6, 'Đặng Đức Thuần', '2024-07-25 10:57:33', '0321986414', 'Hà Nội, Huyện Phú Xuyên, Xã Nam Tiến - Hà Nội', ' Phí Ship: 0VNĐ', 901000.00, 'Thanh toán khi nhận hàng', 1721879837),
(45, 3, 7, 'Lê Đức Trí', '2024-07-30 10:58:35', '0357684287', 'Hà Nội, Huyện Gia Lâm, Xã Phú Thị - Hà Nội', ' Phí Ship: 0VNĐ', 1120000.00, 'Thanh toán khi nhận hàng', 1722311907),
(47, 3, 1, 'Vũ Hoàng Việt', '2024-08-01 11:00:06', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 573000.00, 'Thanh toán khi nhận hàng', 1722484793),
(48, 3, 1, 'Vũ Hoàng Việt', '2024-08-02 11:01:15', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 440000.00, 'Thanh toán khi nhận hàng', 1722571264),
(49, 3, 12, 'Đào Phương Ly', '2024-08-03 11:02:12', '0337614852', 'Hà Nội, Huyện Thường Tín, Xã Vân Tảo - Hà Nội', ' Phí Ship: 0VNĐ', 821000.00, 'Thanh toán khi nhận hàng', 1722657722),
(50, 3, 9, 'Lê Thị Nga', '2024-08-05 11:03:16', '0338546899', 'Hà Nội, Quận Nam Từ Liêm, Phường Xuân Phương - Hà Nội', ' Phí Ship: 0VNĐ', 1083000.00, 'Thanh toán khi nhận hàng', 1722830583),
(51, 3, 17, 'Nguyễn Thiện Tuấn Anh', '2024-08-06 11:06:16', '0985297912', 'Hà Nội, Quận Nam Từ Liên, Phường Đại Mỗ - Hà Nội', ' Phí Ship: 0VNĐ', 1800000.00, 'Thanh toán khi nhận hàng', 1722917060),
(52, 3, 17, 'Nguyễn Thiện Tuấn Anh', '2024-08-07 11:06:44', '0985297912', 'Hà Nội, Quận Nam Từ Liên, Phường Đại Mỗ - Hà Nội', ' Phí Ship: 0VNĐ', 602000.00, 'Thanh toán khi nhận hàng', 1723003604),
(53, 3, 1, 'Vũ Hoàng Việt', '2024-08-10 09:13:58', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 555000.00, 'Thanh toán khi nhận hàng', 1723520369),
(54, 5, 1, 'Vũ Hoàng Việt', '2024-08-11 09:13:58', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 285000.00, 'Thanh toán khi nhận hàng', 1723547940),
(55, 4, 1, 'Vũ Hoàng Việt', '2024-08-14 20:07:14', '0358647581', 'Hà Nội, Thị xã Sơn Tây, Xã Thanh Mỹ - Hà Nội', ' Phí Ship: 0VNĐ', 380000.00, 'Thanh toán khi nhận hàng', 1723548076),
(56, 4, 5, 'Nguyễn Hoàng Nam', '2024-08-15 20:07:08', '0321976474', 'Sơn La, Huyện Mường La, Xã Nậm Păm - Số 8 Đường 15', ' Phí Ship: 0VNĐ', 268000.00, 'Thanh toán khi nhận hàng', 1723727195),
(63, 3, 1, 'Vũ Hoàng Việt', '2024-08-22 12:27:54', '0358632199', 'số 8 ngõ 11 - Xã Ya Tăng, Huyện Sa Thầy, Kon Tum', ' Phí Ship: 0VNĐ', 285000.00, 'Thanh toán khi nhận hàng', 1723884363),
(64, 2, 1, 'Vũ Hoàng Việt', '2024-09-04 09:52:10', '0358632199', 'ngõ 12 - Xã Nậm Păm, Huyện Mường La, Sơn La', ' Phí Ship: 0VNĐ', 2680000.00, 'Thanh toán khi nhận hàng', 1725418330),
(65, 1, 1, 'Vũ Hoàng Việt', '2024-09-04 09:53:46', '0358632199', 'số 8 ngõ 11 - Xã Tân Thành, Huyện Mai Châu, Hòa Bình', ' Phí Ship: 0VNĐ', 1608000.00, 'Thanh toán khi nhận hàng', 1725418426),
(66, 1, 1, 'Vũ Hoàng Việt', '2024-09-14 14:32:59', '0358632199', 'số 8 ngõ 11 - Xã Viêng Lán, Huyện Yên Châu, Sơn La', ' Phí Ship: 0VNĐ', 1908000.00, 'Thanh toán khi nhận hàng', 1726299179),
(67, 0, 1, 'Vũ Hoàng Việt', '2024-09-14 14:35:39', '0358632199', 'số 8 ngõ 11 - Xã Viêng Lán, Huyện Yên Châu, Sơn La', ' Phí Ship: 0VNĐ', 8586000.00, 'Thanh toán khi nhận hàng', 1726299339),
(68, 1, 1, 'Vũ Hoàng Việt', '2024-09-14 14:36:10', '0358632199', 'số 8 ngõ 11 - Xã Viêng Lán, Huyện Yên Châu, Sơn La', ' Phí Ship: 0VNĐ', 1136000.00, 'Thanh toán khi nhận hàng', 1726299370);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(1, 'Vũ Hoàng Việt', 'viethoang1607@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0358632199', 'số 8 ngõ 11 - Xã Viêng Lán, Huyện Yên Châu, Sơn La', 2024),
(2, 'Đặng Văn Long', 'longvan@gmai.com', '202cb962ac59075b964b07152d234b70', '0321986411', 'số 8 ngõ 24 - Thị trấn Kinh Cùng, Huyện Phụng Hiệp, Hậu Giang', 2024),
(3, 'Nguyễn Việt Hoàng', 'viethoang@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0358198641', 'Số 9 ngõ 50 - Xã Văn Bình, Huyện Thường Tín, Hà Nội', 2024),
(4, 'Nguyễn Vũ Đăng', 'vudang@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0321986785', 'số 18 ngõ 23 - Xã Đại áng, Huyện Thanh Trì, Hà Nội', 2024),
(5, 'Nguyễn Hoàng Nam', 'hoangnam@gmail.com', 'c81e728d9d4c2f636f067f89cc14862c', '0321976472', 'số 24 ngõ 6 - Xã Tuyết Nghĩa, Huyện Quốc Oai, Hà Nội', 2024),
(6, 'Đặng Đức Thuần', 'ducthuan@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0321986414', 'số 34 ngõ 42 - Xã Hòa An, Huyện Phụng Hiệp, Hậu Giang', 2023),
(7, 'Lê Đức Trí', 'ductri@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0357684287', 'số 8 ngõ 11 - Xã Văn Phú, Huyện Thường Tín, Hà Nội', 2023),
(8, 'Lê Hoàng Vũ', 'hoangvu@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '0321986415', 'Số 12 ngõ 55 - Thị trấn Kinh Cùng, Huyện Phụng Hiệp, Hậu Giang', 2024),
(9, 'Lê Thị Nga', 'lenga@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0338546899', 'số 21 ngõ 45 - Xã Xuân Giang, Huyện Nghi Xuân, Hà Tĩnh', 2024),
(10, 'Lê Thị Huyền Trang', 'huyentrang@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0326262412', 'số 3 ngõ 24 - Phường Đại Mỗ, Quận Nam Từ Liêm, Hà Nội', 2024),
(11, 'Trần Mỹ Hạnh', 'myhanh@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0324725412', 'số 4 ngõ 12 - Xã Long Đống, Huyện Bắc Sơn, Lạng Sơn', 2024),
(12, 'Đào Phương Ly', 'lyly@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0337614852', 'số 11 ngõ 23 - Xã Đại Thành, Thành phố Ngã Bảy, Hậu Giang', 2024),
(13, 'Trần Minh Châu', 'minhchau@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0343576179', 'số 19 ngõ 24 - Xã Tam Giang, Huyện Yên Phong, Bắc Ninh', 2024),
(14, 'Hoàng Thị Diễm Hằng', 'diemhang@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0324617399', 'số 15 ngõ 16 - Phường Tây Mỗ, Quận Nam Từ Liêm, Hà Nội', 2024),
(15, 'Hoàng Văn Long', 'hoanglong@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0459864282', 'số 8 ngõ 17 - Xã Pú Hồng, Huyện Điện Biên Đông, Điện Biên', 2024),
(16, 'Trần Mỹ Linh', 'mylinh@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0321842688', 'ngõ 12 - Xã Nà Hẩu, Huyện Văn Yên, Yên Bái', 2024),
(17, 'Nguyễn Thiện Tuấn Anh', 'tanh2801@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0985297912', 'Số 9 ngõ 50 - Phường Phương Liệt, Quận Thanh Xuân, Hà Nội', 2024),
(18, 'Lê Đức Gia Huy', 'giahuy@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0321246498', 'số 11 ngõ 42 - Xã Tân Dân, Huyện Mai Châu, Hòa Bình', 2024),
(19, 'Hoàng Văn Thịnh', 'hoangthinh@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0974395478', 'số 2 ngõ 14 - Xã Quý Hòa, Huyện Lạc Sơn, Hòa Bình', 2024),
(20, 'Vũ Tuấn Anh', 'tuananh@gmail.com', 'd9ae0e2d5dcee302a99a87922223651f', '0347684299', 'số 8 ngõ 11 - Xã Tân Tiến, Huyện Văn Giang, Hưng Yên', 2024),
(21, 'Nguyễn Linh Lan', 'linhlan@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '0358385915', 'Số 9 ngõ 50 - Phường Quỳnh Lôi, Quận Hai Bà Trưng, Hà Nội', 2024);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productID` (`product_id`),
  ADD KEY `fk_userID` (`user_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`product_id`),
  ADD KEY `fk_sizes` (`size_id`),
  ADD KEY `fk_transaction` (`transaction_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_catalog` (`catalog_id`);

--
-- Chỉ mục cho bảng `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sizedetail`
--
ALTER TABLE `sizedetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prod_sized` (`product_id`),
  ADD KEY `fk_size` (`size_id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT cho bảng `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sizedetail`
--
ALTER TABLE `sizedetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_productID` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
