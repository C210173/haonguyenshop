-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 22, 2023 lúc 10:14 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `online_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_muc_gio_hang`
--

CREATE TABLE `chi_muc_gio_hang` (
  `id` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `ma_gio_hang` bigint(20) DEFAULT NULL,
  `ma_san_pham` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id` bigint(20) NOT NULL,
  `don_gia` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT 1,
  `ma_don_hang` bigint(20) DEFAULT NULL,
  `ma_san_pham` bigint(20) DEFAULT NULL,
  `so_luong_dat` int(11) NOT NULL,
  `so_luong_nhan_hang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id`, `don_gia`, `so_luong`, `ma_don_hang`, `ma_san_pham`, `so_luong_dat`, `so_luong_nhan_hang`) VALUES
(4, 998, 1, 43, 155, 1, 0),
(5, 999, 1, 44, 29, 1, 0),
(6, 1200, 1, 45, 43, 1, 0),
(7, 1798, 1, 46, 154, 2, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` bigint(20) NOT NULL,
  `ten_danh_muc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten_danh_muc`) VALUES
(1, 'Laptop'),
(2, 'Tablet'),
(3, 'Mobile');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id` bigint(20) NOT NULL,
  `dia_chi_nhan` varchar(255) DEFAULT NULL,
  `ghi_chu` varchar(255) DEFAULT NULL,
  `ho_ten_nguoi_nhan` varchar(255) DEFAULT NULL,
  `ngay_dat_hang` datetime DEFAULT NULL,
  `ngay_giao_hang` datetime DEFAULT NULL,
  `ngay_nhan_hang` datetime DEFAULT NULL,
  `sdt_nhan_hang` varchar(255) DEFAULT NULL,
  `trang_thai_don_hang` varchar(255) DEFAULT NULL,
  `ma_nguoi_dat` bigint(20) DEFAULT NULL,
  `ma_shipper` bigint(20) DEFAULT NULL,
  `tong_gia_tri` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id`, `dia_chi_nhan`, `ghi_chu`, `ho_ten_nguoi_nhan`, `ngay_dat_hang`, `ngay_giao_hang`, `ngay_nhan_hang`, `sdt_nhan_hang`, `trang_thai_don_hang`, `ma_nguoi_dat`, `ma_shipper`, `tong_gia_tri`) VALUES
(43, 'ike2-39-3', NULL, 'HAO NGUYEN', '2023-06-22 14:48:35', '2023-06-22 16:08:14', NULL, '07000001111', 'Delivering', 5, 10, 998),
(44, 'ike2-39-3', NULL, 'HAO NGUYEN', '2023-06-22 14:52:12', '2023-06-22 14:55:42', NULL, '07000001111', 'Delivering', NULL, 8, 999),
(45, 'ike2-39-3', NULL, 'HAO NGUYEN', '2023-06-22 14:53:05', '2023-06-22 14:55:46', NULL, '07000001111', 'Canceled!', 5, 8, 1200),
(46, 'ike2-39-3', NULL, 'HAO NGUYEN', '2023-06-22 15:40:25', '2023-06-22 15:42:49', NULL, '07000001111', 'Delivering', NULL, 8, 1798);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` bigint(20) NOT NULL,
  `tong_tien` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `gio_hang`
--

INSERT INTO `gio_hang` (`id`, `tong_tien`, `ma_nguoi_dung`) VALUES
(4, NULL, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hang_san_xuat`
--

CREATE TABLE `hang_san_xuat` (
  `id` bigint(20) NOT NULL,
  `ten_hang_san_xuat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hang_san_xuat`
--

INSERT INTO `hang_san_xuat` (`id`, `ten_hang_san_xuat`) VALUES
(2, 'Apple'),
(3, 'Asus'),
(4, 'Acer'),
(5, 'Dell'),
(6, 'HP'),
(7, 'Lenovo'),
(8, 'MSI');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lien_he`
--

CREATE TABLE `lien_he` (
  `id` bigint(20) NOT NULL,
  `email_lien_he` varchar(255) DEFAULT NULL,
  `ngay_lien_he` datetime DEFAULT NULL,
  `ngay_tra_loi` datetime DEFAULT NULL,
  `noi_dung_lien_he` varchar(255) DEFAULT NULL,
  `noi_dung_tra_loi` varchar(255) DEFAULT NULL,
  `trang_thai` varchar(255) DEFAULT NULL,
  `ma_nguoi_tra_loi` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lien_he`
--

INSERT INTO `lien_he` (`id`, `email_lien_he`, `ngay_lien_he`, `ngay_tra_loi`, `noi_dung_lien_he`, `noi_dung_tra_loi`, `trang_thai`, `ma_nguoi_tra_loi`) VALUES
(4, 'haolk4@gmail.com', '2023-06-22 14:19:46', '2023-06-22 14:21:01', 'lỗi hoài z', 'không sao sửa được', 'Answered', NULL),
(5, 'Tuanvu8031@gmail.com', '2023-06-22 15:57:30', NULL, 'test contact', NULL, 'Waiting for reply', NULL),
(6, 'haolk4@gmail.com', '2023-06-22 16:01:17', '2023-06-22 16:02:35', 'test', 'test ok', 'Answered', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung_vaitro`
--

CREATE TABLE `nguoidung_vaitro` (
  `ma_nguoi_dung` bigint(20) NOT NULL,
  `ma_vai_tro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung_vaitro`
--

INSERT INTO `nguoidung_vaitro` (`ma_nguoi_dung`, `ma_vai_tro`) VALUES
(1, 1),
(5, 2),
(8, 3),
(9, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` bigint(20) NOT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `dia_chi`, `email`, `ho_ten`, `password`, `so_dien_thoai`) VALUES
(1, 'tokyo', 'admin@gmail.com', 'ADMIN HAO', '$2a$10$n7NTLONnmFN.bbSLhyduz.llbDjSEkAUoxvyGgRhTRsbnHLfbdBf6', '123456789'),
(5, 'gia lai', 'haolk4@gmail.com', 'NGUYEN HAO', '$2a$10$qYQY1LQzfS2/aQCeRNRhzuiw9ySeY0jUbkIPxsTBDpNDl3oRMn.DS', '0123456789'),
(8, 'ike2-39-3', 'ship@gmail.com', 'hào hào', '$2a$10$5hdwYRus3fO2EAeOldpH8Oa/jxFcQZvQqv6izVzYLe/weR0tWwzPy', '07000001111'),
(9, NULL, 'member@gmail.com', NULL, '$2a$10$oskhbs9yUHAfYep.igyZ/Oy.M/YT.mJlVs3galJrVvg36/NaFfzNG', NULL),
(10, 'ike', 'shipper@gmail.com', 'HAOPro', '$2a$10$knrWYKh1a5qd9n0zh6Cj1eOE6xVWWOk4tMexWzy1BWqvBZPLuNSk.', '07000001111');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id` bigint(20) NOT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `don_gia` bigint(20) NOT NULL,
  `don_vi_ban` int(11) NOT NULL,
  `don_vi_kho` int(11) NOT NULL,
  `dung_luong_pin` varchar(255) DEFAULT NULL,
  `he_dieu_hanh` varchar(255) DEFAULT NULL,
  `man_hinh` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `thiet_ke` varchar(255) DEFAULT NULL,
  `thong_tin_bao_hanh` varchar(255) DEFAULT NULL,
  `thong_tin_chung` varchar(255) DEFAULT NULL,
  `ma_danh_muc` bigint(20) DEFAULT NULL,
  `ma_hang_sx` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id`, `cpu`, `don_gia`, `don_vi_ban`, `don_vi_kho`, `dung_luong_pin`, `he_dieu_hanh`, `man_hinh`, `ram`, `ten_san_pham`, `thiet_ke`, `thong_tin_bao_hanh`, `thong_tin_chung`, `ma_danh_muc`, `ma_hang_sx`) VALUES
(4, ' Intel, Core i5, 1.8 Ghz', 1200, 0, 100, '6000mAh', 'Mac Os', '13.3 inch LED-backlit', ' 8 GB, LPDDR3, 1600 Mhz', 'Macbook Air 13 256GB MQD42SA/A (2017)', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'upgraded performance, extremely long battery life, suitable for light office work needs, no need to focus too much on the display of the screen', 1, 2),
(6, ' Intel, Core i5, 2.3 GHz', 1330, 0, 200, '6000mAh', 'Mac Os', ' 13.3 inch LED-backlit', ' 8 GB, LPDDR3, 2133MHz', 'Macbook Pro 13 inch 128GB (2017)', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'upgraded performance, extremely long battery life, suitable for light office work needs, no need to focus too much on the display of the screen', 1, 2),
(7, 'Intel, Core i5, 2.3GHz', 1500, 0, 100, '7000mAh', 'Mac Os', '13.3 inch, Retina (2560 x 1600 pixels)', '8 GB, LPDDR3, 2133 MHz', 'Macbook Pro 13 Touch Bar 256 GB (2018)', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'upgraded performance, extremely long battery life, suitable for light office work needs, no need to focus too much on the display of the screen', 1, 2),
(8, 'Intel, Core i5, 2.3GHz', 1700, 0, 150, '7000mAh', 'Mac Os', '13.3 inch, Retina (2560 x 1600 pixels)', '8 GB, LPDDR3, 2133 MHz', 'Macbook Pro 13 Touch Bar 512 GB (2018)', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'upgraded performance, extremely long battery life, suitable for light office work needs, no need to focus too much on the display of the screen', 1, 2),
(9, 'Intel, Core i7, 2.2GHz', 1300, 0, 200, '7000mAh', 'Mac Os', '15.4 inch, Retina (2880 x 1800 pix', '16GB, LPDDR4, 2400MHz', 'Macbook Pro 15 Touch Bar 256 GB (2018)', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'upgraded performance, extremely long battery life, suitable for light office work needs, no need to focus too much on the display of the screen', 1, 2),
(19, ' Intel, Celeron, 1.10 GHz', 599, 0, 300, '7000', ' Linux', '5.6 inchAcer CineCrystal LED', ' 4 GB DDR3L 1333 MHz', 'Acer AS A315-31-C8GB', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'Perfectly refined and elegant design', 1, 4),
(20, ' Intel Celeron N4000', 609, 0, 100, '8000', 'Linux', ' 15.6 inchs HD LED Backlight', '4 GB DDR4 2133 MHz', 'Acer A315-32-C9A4 ', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'Perfectly refined and elegant design', 1, 4),
(21, ' Intel Core i3-7020U', 899, 0, 100, '8000', ' Linux', '14.0 inchs HD LED', '4 GB DDR4 2400 MHz', 'Acer E5-476-33BQ', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'Perfectly refined and elegant design', 1, 4),
(24, ' Intel Core i3', 999, 0, 130, '5000', 'Linux', '15.6 inch  HD', ' 4 GB DDR4 2133 MHz', 'Acer A315-51-364W', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'Perfectly refined and elegant design', 1, 4),
(26, ' Intel Core i5-8250U', 469, 0, 130, '6000', ' Windows 10 Home', '14.0 inchs FHD IPS LCD', ' 4 GB DDR4 2133 MHz', 'Acer Swift SF314-52-55UF', 'Unchanged design, luxurious aluminum shell, ultra-thin and ultra-light', '12 month', 'Perfectly refined and elegant design', 1, 4),
(29, 'Intel, Core i3, 2.0 GHz', 999, 0, 100, '6000', 'Ubuntu 16.04', '14 inchHD Anti-Glare LED', '4 GB, DDR4, 2400MHz', 'Dell Inspiron N3467', 'Compact design for portability', '12 month', 'Perfectly refined and elegant design', 1, 5),
(33, 'Intel Core i3-7020U', 1189, 0, 110, '8000', ' Windows 10 Home', '15.6 inches Anti-Glare LED', ' 4 GB DDR4 2400 MHz', 'Dell Vostro 3568', 'Compact design for portability', '12 month', 'Perfectly refined and elegant design', 1, 5),
(34, ' Intel, Core i3, 2.40 GHz', 1249, 0, 100, '8000', 'Free DOS', '14 inchHD Anti-Glare LED', '4 GB, DDR4, 2133 MHz', 'Dell Vostro V5468/i3', 'Compact design for portability', '12 month', 'Perfectly refined and elegant design', 1, 5),
(35, ' Intel Celeron', 599, 0, 100, '5000', 'Linux', ' 15.6 inchs', ' 4 GB DDR3L 1600 MHz', 'HP 15-bs644TU/Celeron-N3060', 'Compact design for portability', '12 month', 'Perfectly refined and elegant design', 1, 6),
(38, ' Intel, Core i3, 2.0 GHz', 899, 0, 80, '8000', ' Free Dos', '15.6 inch LED-backlit', ' 4GB, DDR4, 2133 MHz', 'HP 15-bs555TU', 'Compact design for portability', '12 month', 'Perfectly refined and elegant design', 1, 6),
(40, ' Intel Core i3-7100U', 1149, 0, 90, '6000', ' Free DOS', ' 15.6 inch', ' 4GB DDR4', 'HP Pavilion 15-cc043TU', 'Compact design for portability', '12 month', 'Perfectly refined and elegant design', 1, 6),
(43, 'Intel, Celeron, 1.10 GHz', 1200, 0, 100, '6000', ' Windows 10 EM', ' 11.6 inchHD LED', ' 2 GB, LPDDR4, 2400MHz', 'Lenovo Ideapad 120S-11IAP', 'Compact design for portability', '6 month', 'Perfectly refined and elegant design', 1, 7),
(52, ' Intel Core i5-8250U', 1550, 0, 120, '8000', 'Windows 10 Home', '14.0 inchs FHD IPS 72%', ' 8 GB DDR4 2666 MHz', 'MSI PS42 8M-296VN/i5-8250U', 'Own the traditional design style of MSI', '12 month', 'The distinctive soft rubber coated matte black finish provides a better grip. The components of the lid including the case, screen and screen bezel are all tightly pressed to optimize the weight to only 2.2 kg.', 1, 8),
(54, ' Intel Core i5-8300H', 1700, 0, 140, '7000', 'Windows 10', '15.6 inchs FullHD IPS 45% ', ' 8 GB DDR4 2666 MHz', 'MSI GF63 8RC-203VN/I5-8300H', 'Own the traditional design style of MSI', '12 month', 'The distinctive soft rubber coated matte black finish provides a better grip. The components of the lid including the case, screen and screen bezel are all tightly pressed to optimize the weight to only 2.2 kg.', 1, 8),
(55, ' Intel, Core i7, 2.8 GHz', 1650, 0, 150, '8000', '  DOS', '  17.3 inch', ' 8 GB, DDR4, 2400 MHz', 'MSI GL72M 7REX - 1427XVN', 'Own the traditional design style of MSI', '12 month', 'The distinctive soft rubber coated matte black finish provides a better grip. The components of the lid including the case, screen and screen bezel are all tightly pressed to optimize the weight to only 2.2 kg.', 1, 8),
(56, ' Intel, Core i7, 2.80 GHz', 1480, 0, 110, '7000', ' Free DOS', ' 15.6 inchWide-View', ' 8 GB, DDR4, 2400MHz', 'MSI GF62 7RE-1818XVN', 'Own the traditional design style of MSI', '12 month', 'The distinctive soft rubber coated matte black finish provides a better grip. The components of the lid including the case, screen and screen bezel are all tightly pressed to optimize the weight to only 2.2 kg.', 1, 8),
(145, NULL, 760, 0, 100, NULL, NULL, NULL, NULL, 'Ipad Air m1', NULL, '12 month', 'The amazing M1 chip has arrived in the iPad Air. 8-core CPU performance is up to 60% faster than the previous generation model. It\'s incredibly powerful whether you\'re unleashing your creativity or playing mobile games', 2, 2),
(146, NULL, 359, 0, 100, NULL, NULL, NULL, NULL, 'Ipad gen 10', NULL, '12 month', '10.9 inch, Liquid Retina HD, 2360 x 1640 Pixels\r\nCamera 12.0 MP\r\nApple A14 Bionic RAM 64 GB', 2, 2),
(147, NULL, 998, 0, 80, NULL, NULL, NULL, NULL, 'ipad pro 2020', NULL, '12 month', 'With each new tablet version, Apple upgrades at some point to increase the user experience.', 2, 2),
(148, NULL, 999, 0, 50, NULL, NULL, NULL, NULL, 'Ipad pro m1 2021', NULL, '12 month', 'With dimensions of 28.1 x 21.5 x 0.59cm (HWD) and weighing 0.64kg, you can easily carry it anywhere. The outer shell is covered with high-grade aluminum monolithic metal. The two colors used are silver and space gray.', 2, 2),
(149, NULL, 420, 0, 10, NULL, NULL, NULL, NULL, 'Dell Latitude 7275', NULL, '6 month', 'Laptop/Tablet PC (Intel Core M5-6Y57, 8GB Ram, 256GB Solid State SSD, Dual Camera, Type C Port, WIFI) Win 10 Pro (Renewed)', 2, 5),
(151, NULL, 1202, 0, 40, NULL, NULL, NULL, NULL, 'Lenovo Tablet M10', NULL, '12 month', '10.61-inch wide IPS LCD for beautiful photos and videos\r\nQualcomm® Snapdragon™ 680\r\nElegant design with dual-tone finish\r\nAtmos immersive sound', 2, 7),
(152, NULL, 699, 0, 100, NULL, NULL, NULL, NULL, 'Iphone 14', NULL, '12 month', 'iPhone 14 has a Super Retina XDR OLED screen with a notch, size 6.7 inches, combining True Tone, HDR, Haptic Touch algorithms. ', 3, 2),
(153, NULL, 799, 0, 100, NULL, NULL, NULL, NULL, 'iphone 14 plus', NULL, '12 month', 'iPhone 14 Plus has a Super Retina XDR OLED screen with a notch, size 6.7 inches, combining True Tone, HDR, Haptic Touch algorithms. ', 3, 2),
(154, NULL, 899, 0, 100, NULL, NULL, NULL, NULL, 'iphone 14 pro', NULL, '12 month', 'iPhone 14 pro has a Super Retina XDR OLED screen with a notch, size 6.7 inches, combining True Tone, HDR, Haptic Touch algorithms. ', 3, 2),
(155, NULL, 998, 0, 100, NULL, NULL, NULL, NULL, 'iphone 14 promax', NULL, '12 month', 'iPhone 14 promax has a Super Retina XDR OLED screen with a notch, size 6.7 inches, combining True Tone, HDR, Haptic Touch algorithms. ', 3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vai_tro`
--

CREATE TABLE `vai_tro` (
  `id` bigint(20) NOT NULL,
  `ten_vai_tro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vai_tro`
--

INSERT INTO `vai_tro` (`id`, `ten_vai_tro`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MEMBER'),
(3, 'ROLE_SHIPPER');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK49lmmclnjgb7eck20lwhv0cks` (`ma_gio_hang`),
  ADD KEY `FKkd69a7wiulr4xgohxl0rlhth4` (`ma_san_pham`);

--
-- Chỉ mục cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9wl3houbukbxpixsut6uvojhy` (`ma_don_hang`),
  ADD KEY `FK3ry84nmdxgoarx53qjxd671tk` (`ma_san_pham`);

--
-- Chỉ mục cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnwjiboxao1uvw1siemkvs1jb9` (`ma_nguoi_dat`),
  ADD KEY `FKgndcrlvetoudr3jaif9b7ay37` (`ma_shipper`);

--
-- Chỉ mục cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKitverect56puwr47y7tyvy6er` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `hang_san_xuat`
--
ALTER TABLE `hang_san_xuat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6jm47uh7f94pc3wix0duvedde` (`ma_nguoi_tra_loi`);

--
-- Chỉ mục cho bảng `nguoidung_vaitro`
--
ALTER TABLE `nguoidung_vaitro`
  ADD PRIMARY KEY (`ma_nguoi_dung`,`ma_vai_tro`),
  ADD KEY `FKig6jxd861mqv02a8pn68r43fr` (`ma_vai_tro`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqss6n6gtx6lhb7flcka9un18t` (`ma_danh_muc`),
  ADD KEY `FKchvjvgjnq8lbt9mjtyfn5pksq` (`ma_hang_sx`);

--
-- Chỉ mục cho bảng `vai_tro`
--
ALTER TABLE `vai_tro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hang_san_xuat`
--
ALTER TABLE `hang_san_xuat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT cho bảng `vai_tro`
--
ALTER TABLE `vai_tro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  ADD CONSTRAINT `FK49lmmclnjgb7eck20lwhv0cks` FOREIGN KEY (`ma_gio_hang`) REFERENCES `gio_hang` (`id`),
  ADD CONSTRAINT `FKkd69a7wiulr4xgohxl0rlhth4` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`);

--
-- Các ràng buộc cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `FK3ry84nmdxgoarx53qjxd671tk` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`),
  ADD CONSTRAINT `FK9wl3houbukbxpixsut6uvojhy` FOREIGN KEY (`ma_don_hang`) REFERENCES `don_hang` (`id`);

--
-- Các ràng buộc cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `FKgndcrlvetoudr3jaif9b7ay37` FOREIGN KEY (`ma_shipper`) REFERENCES `nguoi_dung` (`id`),
  ADD CONSTRAINT `FKnwjiboxao1uvw1siemkvs1jb9` FOREIGN KEY (`ma_nguoi_dat`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `FKitverect56puwr47y7tyvy6er` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  ADD CONSTRAINT `FK6jm47uh7f94pc3wix0duvedde` FOREIGN KEY (`ma_nguoi_tra_loi`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `nguoidung_vaitro`
--
ALTER TABLE `nguoidung_vaitro`
  ADD CONSTRAINT `FKig6jxd861mqv02a8pn68r43fr` FOREIGN KEY (`ma_vai_tro`) REFERENCES `vai_tro` (`id`),
  ADD CONSTRAINT `FKocavcnspu1wcvp2w0s4usfgbf` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `FKchvjvgjnq8lbt9mjtyfn5pksq` FOREIGN KEY (`ma_hang_sx`) REFERENCES `hang_san_xuat` (`id`),
  ADD CONSTRAINT `FKqss6n6gtx6lhb7flcka9un18t` FOREIGN KEY (`ma_danh_muc`) REFERENCES `danh_muc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
