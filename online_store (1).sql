-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 03, 2021 lúc 02:58 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.3

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `chi_muc_gio_hang`
--

INSERT INTO `chi_muc_gio_hang` (`id`, `so_luong`, `ma_gio_hang`, `ma_san_pham`) VALUES
(68, 1, 2, 35),
(73, 20, 1, 35),
(74, 1, 1, 34);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id`, `don_gia`, `so_luong`, `ma_don_hang`, `ma_san_pham`, `so_luong_dat`, `so_luong_nhan_hang`) VALUES
(1, 1350000, 1, 1, 33, 1, 1),
(2, 900000, 1, 1, 32, 1, 1),
(3, 1500000, 1, 2, 10, 1, 1),
(4, 900000, 1, 2, 32, 1, 1),
(5, 2700000, 1, 2, 33, 2, 2),
(6, 1800000, 1, 2, 35, 2, 2),
(7, 1860000, 1, 3, 26, 1, 0),
(8, 3900000, 1, 3, 27, 1, 0),
(9, 15800000, 1, 3, 28, 1, 0),
(10, 3900000, 1, 4, 27, 1, 0),
(11, 15800000, 1, 4, 28, 1, 0),
(12, 900000, 1, 4, 32, 1, 0),
(13, 1350000, 1, 5, 33, 1, 0),
(14, 900000, 1, 5, 35, 1, 0),
(15, 1250000, 1, 5, 31, 1, 0),
(16, 3800000, 1, 6, 25, 1, 1),
(17, 15800000, 1, 6, 28, 1, 1),
(18, 2000000, 1, 6, 30, 1, 1),
(19, 6000000, 1, 7, 29, 1, 0),
(20, 900000, 1, 7, 35, 1, 0),
(21, 4050000, 1, 8, 33, 3, 3),
(22, 27000000, 1, 8, 34, 3, 3),
(23, 900000, 1, 9, 32, 1, 1),
(24, 1250000, 1, 9, 31, 1, 1),
(25, 2000000, 1, 9, 30, 1, 1),
(26, 1800000, 1, 10, 35, 2, 0),
(27, 27000000, 1, 10, 34, 3, 0),
(28, 27000000, 1, 11, 34, 3, 3),
(29, 1800000, 1, 11, 35, 2, 2),
(30, 900000, 1, 11, 35, 1, 1),
(31, 9000000, 1, 11, 34, 1, 1),
(32, 1250000, 1, 11, 31, 1, 1),
(33, 2000000, 1, 11, 30, 1, 1),
(34, 900000, 1, 12, 35, 1, 1),
(35, 9000000, 1, 12, 34, 1, 1),
(36, 1350000, 1, 12, 33, 1, 1),
(37, 900000, 1, 13, 32, 1, 1),
(38, 6000000, 1, 13, 29, 1, 1),
(39, 2000000, 1, 13, 30, 1, 1),
(40, 11700000, 1, 14, 27, 3, 3),
(41, 11700000, 1, 15, 27, 3, 0),
(42, 18000000, 1, 16, 29, 3, 0),
(43, 27000000, 1, 17, 34, 3, 0),
(44, 3600000, 1, 17, 35, 4, 0),
(45, 900000, 1, 17, 35, 1, 0),
(46, 9000000, 1, 17, 34, 1, 0),
(47, 900000, 1, 18, 35, 1, 0),
(48, 2000000, 1, 19, 30, 1, 0),
(49, 9000000, 1, 20, 34, 1, 1),
(50, 4800000, 1, 21, 24, 1, 1),
(51, 6000000, 1, 22, 29, 1, 0),
(52, 6000000, 1, 22, 29, 1, 0),
(53, 9000000, 1, 23, 34, 1, 1),
(54, 900000, 1, 23, 35, 1, 1),
(55, 1250000, 1, 23, 31, 1, 1),
(56, 2500000, 1, 24, 31, 2, 2),
(57, 9000000, 1, 24, 34, 1, 1),
(58, 2000000, 1, 25, 30, 1, 0),
(59, 18000000, 1, 25, 34, 2, 0),
(60, 90000000, 1, 26, 34, 10, 0),
(61, 3600000, 1, 26, 35, 4, 0),
(62, 3600000, 1, 26, 35, 4, 0),
(63, 27000000, 1, 26, 34, 3, 0),
(64, 1350000, 1, 27, 33, 1, 0),
(65, 9000000, 1, 27, 34, 1, 0),
(66, 1350000, 1, 28, 33, 1, 1),
(67, 9000000, 1, 28, 34, 1, 1),
(68, 1350000, 1, 28, 33, 1, 1),
(69, 1350000, 1, 29, 33, 1, 1),
(70, 15800000, 1, 30, 28, 1, 1),
(71, 6000000, 1, 30, 29, 1, 1),
(72, 6000000, 1, 31, 29, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` bigint(20) NOT NULL,
  `ten_danh_muc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten_danh_muc`) VALUES
(1, 'BÌNH TÀI LỘC'),
(2, 'BÌNH HOA - LỌ HOA'),
(3, 'TRỨNG PHONG THỦY'),
(4, 'HỒ LÔ GỐM SỨ'),
(5, 'ĐÈN BÀN GỐM'),
(6, 'TRANH GỐM'),
(7, 'TƯỢNG GỐM'),
(8, '\r\n\r\nĐĨA CẢNH ');

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
  `tong_gia_tri` bigint(20) NOT NULL,
  `ma_employee` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id`, `dia_chi_nhan`, `ghi_chu`, `ho_ten_nguoi_nhan`, `ngay_dat_hang`, `ngay_giao_hang`, `ngay_nhan_hang`, `sdt_nhan_hang`, `trang_thai_don_hang`, `ma_nguoi_dat`, `ma_shipper`, `tong_gia_tri`, `ma_employee`) VALUES
(1, 'số nhà 32', 'Ghi chú employee: \nđã giao hàng<br> Ghi chú admin:\nHoàn Thành', 'trần đình thiện', '2021-11-02 09:21:31', '2021-10-02 09:21:48', '2021-10-03 09:22:06', '0979130071', 'Hoàn thành', 1, NULL, 2250000, 16),
(2, 'Phố cổ', 'Ghi chú employee: \nđang giao', 'Tú Tiền Tỉ', '2021-09-02 09:45:32', '2020-09-03 10:34:59', '2020-11-09 09:40:26', '0123456789', 'Hoàn thành', 1, NULL, 6900000, 16),
(3, 'Hồ Tây', NULL, 'Tú Tiền lẻ', '2021-11-02 09:47:53', '2021-11-06 09:45:04', NULL, '0369875698', 'Đang giao', 1, NULL, 21560000, 16),
(4, 'fptpolytechnich', NULL, 'lý thông bá', '2021-11-02 10:09:39', '2021-11-06 09:45:08', NULL, '0987895661', 'Đang giao', 1, NULL, 20600000, 16),
(5, 'hhhhhhh', NULL, 'Nguyễn Hữu Tú ', '2021-11-02 10:11:59', '2021-11-06 09:45:11', NULL, '0979130071', 'Đang giao', 1, NULL, 3500000, 16),
(6, 'okok', 'Ghi chú employee: \noki<br> Ghi chú admin:\nthành công', 'có bị gì ', '2021-09-02 10:15:05', '2021-09-02 10:17:28', '2021-09-02 10:18:06', '0123456987', 'Hoàn thành', 1, NULL, 21600000, 16),
(7, 'nununyuyn', NULL, 'trần cung', '2021-11-02 10:16:03', '2021-11-06 09:45:13', NULL, '0911085131', 'Đang giao', 1, NULL, 6900000, 16),
(8, 'hn', 'Ghi chú employee: \nđang giao<br> Ghi chú admin:\nok', 'hà', '2021-11-06 09:38:02', '2021-11-06 09:38:39', '2021-11-06 09:40:16', '124243434234', 'Hoàn thành', 1, NULL, 31050000, 16),
(9, 'hnnn', 'Ghi chú employee: \nok\n', 'hà', '2021-11-09 11:50:18', '2021-11-10 12:24:39', '2021-11-10 12:25:59', '124243434234', 'Hoàn thành', 1, NULL, 4150000, 16),
(10, 'hhhh', NULL, 'hà', '2021-11-10 09:16:56', '2021-11-10 12:20:24', NULL, '124243434234', 'Đã bị hủy', 1, NULL, 28800000, 16),
(11, '5gf', 'Ghi chú employee: \nok\n', 'hà', '2021-11-10 11:37:21', '2021-11-10 11:39:07', '2021-11-10 12:25:45', '35354354', 'Hoàn thành', 1, NULL, 41950000, 16),
(12, '5gt', 'Ghi chú employee: \nda nhan', 'dat', '2021-11-10 12:39:32', '2021-11-10 12:41:57', '2021-11-10 12:42:32', '1235555555', 'Hoàn thành', 1, NULL, 11250000, 16),
(13, 'dat', 'Ghi chú employee: \nda nhan', 'hoang', '2021-11-10 12:40:14', '2021-11-10 12:42:01', '2021-11-10 12:42:39', '0989987795', 'Hoàn thành', 1, NULL, 8900000, 16),
(14, 'hh', 'Ghi chú employee: \nda nhan', 'tu', '2021-11-10 12:41:23', '2021-11-10 12:42:04', '2021-11-10 12:42:44', '9337372777272', 'Hoàn thành', 1, NULL, 11700000, 16),
(15, 'ffs', NULL, 'hoang', '2021-11-10 12:49:39', '2021-11-10 12:55:58', NULL, '5435435435', 'Đang giao', 1, NULL, 11700000, 16),
(16, 'fsgsgsg', NULL, 'dat', '2021-11-10 12:56:50', NULL, NULL, '0989987795', 'Đã bị hủy', 1, NULL, 18000000, NULL),
(17, 'sdsf', NULL, 'dat', '2021-11-11 10:24:54', NULL, NULL, '123456', 'Đã bị hủy', 1, NULL, 40500000, NULL),
(18, 'dat', NULL, 'dat', '2021-11-11 10:26:07', '2021-11-17 10:54:09', NULL, '33434324324', 'Đang giao', 1, NULL, 900000, 16),
(19, 'hhhhhh', NULL, 'Trần Hữu Hoàng', '2021-11-11 10:27:53', '2021-11-22 10:35:10', NULL, '33434324324', 'Đang giao', 1, NULL, 2000000, 16),
(20, 'kkkkk', 'Ghi chú employee: \nthành công<br> Ghi chú admin:\nok', 'tú', '2021-11-11 10:28:17', '2021-11-11 10:28:38', '2021-11-11 23:43:10', '123456', 'Hoàn thành', 1, NULL, 9000000, 16),
(21, 'oh', 'Ghi chú employee: \nok<br> Ghi chú admin:\nik', 'Trần Hữu Hoàng', '2021-11-11 10:39:43', '2021-11-11 10:40:08', '2021-11-11 10:40:27', '33434324324', 'Hoàn thành', 1, NULL, 4800000, 16),
(22, 'dat', NULL, 'mon', '2021-11-11 10:42:55', NULL, NULL, '33434324324', 'Đã bị hủy', 1, NULL, 12000000, NULL),
(23, 'hab', 'Ghi chú employee: \nthành công<br> Ghi chú admin:\nHoàn thanh đơn hàng', 'hà', '2021-11-11 23:16:52', '2021-11-11 23:17:14', '2021-11-11 23:18:20', '124243434234', 'Hoàn thành', 1, NULL, 11150000, 16),
(24, 'hà nội', 'Ghi chú employee: \nthành công<br> Ghi chú admin:\nHoàn tất', 'hoang', '2021-11-11 23:31:56', '2021-11-11 23:37:27', '2021-11-11 23:38:24', '0989987795', 'Hoàn thành', 1, NULL, 11500000, 16),
(25, 'vinh phuc', NULL, 'hà', '2021-11-11 23:44:17', NULL, NULL, '1235555555', 'Đang chờ giao', 1, NULL, 20000000, NULL),
(26, 'hà nội', NULL, 'hà', '2021-11-12 11:20:11', '2021-11-12 11:21:15', NULL, '5435435435', 'Đang giao', 1, NULL, 124200000, 16),
(27, 'hà nội', NULL, 'hoang', '2021-11-16 09:18:55', NULL, NULL, '0989987795', 'Đang chờ giao', 1, NULL, 10350000, NULL),
(28, '113 lb', NULL, 'hiep', '2021-11-20 10:28:16', NULL, '2021-11-22 10:36:03', '113', 'Đang chờ giao', 16, NULL, 11700000, NULL),
(29, 'ngoclam', NULL, 'dang', '2021-11-22 10:31:07', NULL, '2021-11-22 10:36:08', '0987776564', 'Đang chờ giao', 1, NULL, 1350000, NULL),
(30, 'ngocthuy', NULL, 'dang', '2021-11-22 10:33:35', NULL, '2021-11-22 10:36:12', '11231111', 'Đang chờ giao', 1, NULL, 21800000, NULL),
(31, 'hsgdhdhbjssa', NULL, 'datkhac', '2021-11-24 09:26:35', NULL, NULL, '115', 'Đang chờ xác nhận khách mua', 1, NULL, 6000000, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` bigint(20) NOT NULL,
  `tong_tien` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `gio_hang`
--

INSERT INTO `gio_hang` (`id`, `tong_tien`, `ma_nguoi_dung`) VALUES
(1, NULL, 1),
(2, NULL, 18),
(3, NULL, 16);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hang_san_xuat`
--

CREATE TABLE `hang_san_xuat` (
  `id` bigint(20) NOT NULL,
  `ten_hang_san_xuat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hang_san_xuat`
--

INSERT INTO `hang_san_xuat` (`id`, `ten_hang_san_xuat`) VALUES
(2, 'BÁT TRÀNG');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lien_he`
--

INSERT INTO `lien_he` (`id`, `email_lien_he`, `ngay_lien_he`, `ngay_tra_loi`, `noi_dung_lien_he`, `noi_dung_tra_loi`, `trang_thai`, `ma_nguoi_tra_loi`) VALUES
(1, 'dattran622001@gmail.com', '2021-11-03 22:41:48', '2021-11-03 22:44:51', 'anh ơi', 'anh đây em à', 'Đã trả lời', NULL),
(2, 'dattran622001@gmail.com', '2021-11-03 22:43:50', '2021-11-03 22:45:22', 'anh ơi bao nhiêu ', 'bao nhiêu là bao nhiêu\n', 'Đã trả lời', NULL),
(3, 'dattran622001@gmail.com', '2021-11-03 22:48:17', '2021-11-03 22:49:07', 'anh bao nhiều là bao nhiêu là bao nhiêu', 'là bao nhiêu là bao nhiêu là bao nhiêu m ngu vừa thôi', 'Đã trả lời', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung_vaitro`
--

CREATE TABLE `nguoidung_vaitro` (
  `ma_nguoi_dung` bigint(20) NOT NULL,
  `ma_vai_tro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nguoidung_vaitro`
--

INSERT INTO `nguoidung_vaitro` (`ma_nguoi_dung`, `ma_vai_tro`) VALUES
(1, 1),
(2, 2),
(16, 7),
(17, 1),
(18, 1),
(19, 7);

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
  `so_dien_thoai` varchar(255) DEFAULT NULL,
  `is_blocked` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `dia_chi`, `email`, `ho_ten`, `password`, `so_dien_thoai`, `is_blocked`) VALUES
(1, 'Long Biên , Hà Nội,', 'admin@gmail.com', 'Nguyễn Quang Hiệp', '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', '0943407266', b'0'),
(2, NULL, 'member@gmail.com', NULL, '$2a$10$j7Upgupou72GBmukz0G6pOATk3wlCAgaoFCEqAhSvLToD/V/1wlpu', '0979130071', b'0'),
(16, 'campuchia', 'Caodinhvanvo@gmail.com', 'Cao Đình Văn Vở', '$2a$10$KXYchFszWs/koiWnw8kk8u4ZoiI2coKkzXRmCN2nXDSy2X3FfMo/6', '0911085131', b'0'),
(17, NULL, 'employee@gmail.com', NULL, '$2a$10$o16Fi7RcT3en6DZvvUT4nuO0E0sgdCIhIiaQS69LnOMSg9dXDKOZW', NULL, b'0'),
(18, 'hà nội', 'ngacanh09@gmail.com', 'Đạt', '$2a$10$f0oW2FqU6cdv/Recta3KleLPtlgOklC5jK621PPcyIbh4KPWfbskq', '0989987776', b'0'),
(19, 'ha nam', 'baolee226@gmail.com', 'Tran Dinh Thien', '$2a$10$RDODnOcpAjFflYPahShF4enHvMiB5OzwB.Yb/yNEjmnTf2Udoa7Qe', '0988776345', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id` bigint(20) NOT NULL,
  `ma_danh_muc` bigint(20) DEFAULT NULL,
  `ma_hang_sx` bigint(20) DEFAULT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `thong_tin_chung` varchar(255) DEFAULT NULL,
  `don_gia` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `thiet_ke` varchar(255) DEFAULT NULL,
  `mau_sac` varchar(255) NOT NULL,
  `chat_lieu` varchar(255) NOT NULL,
  `kich_thuoc` varchar(255) NOT NULL,
  `thong_tin_bao_hanh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id`, `ma_danh_muc`, `ma_hang_sx`, `ten_san_pham`, `thong_tin_chung`, `don_gia`, `so_luong`, `thiet_ke`, `mau_sac`, `chat_lieu`, `kich_thuoc`, `thong_tin_bao_hanh`) VALUES
(2, 1, 2, 'BÌNH HÚT LỘC VẼ VÀNG THUẬN BUỒM XUÔI GIÓ CAO CẤP H35', 'Bình tài lộc xét về hình dáng miệng loe rộng, giữa cổ thắt lại thân dưới phình to đến cực đại và điểm cuối thu nhỏ lại dần đặt lên trên kệ gỗ rất phù hợp.', 5600000, 100, 'nhị cảnh thuận buồm xuôi gió, chữ Lộc', 'xanh lam vẽ vàng', 'Sứ cao cấp vẽ vàng 34k', 'Cao 35 cm', '12 tháng'),
(3, 1, 2, 'BÌNH HÚT LỘC CÔNG DANH PHÚ QUÝ VẼ VÀNG 30CM', 'Bình tài lộc xét về hình dáng miệng loe rộng, giữa cổ thắt lại thân dưới phình to đến cực đại và điểm cuối thu nhỏ lại dần đặt lên trên kệ gỗ rất phù hợp.', 3500000, 100, 'Chim công, hoa đào, phù dung', '', 'Sứ cao cấp vẽ vàng 34k', 'Cao 30 cm', '12 tháng'),
(4, 1, 2, 'BÌNH HÚT LỘC CHIM CÔNG HOA ĐÀO NỀN VÀNG 35CM', 'Bình tài lộc xét về hình dáng miệng loe rộng, giữa cổ thắt lại thân dưới phình to đến cực đại và điểm cuối thu nhỏ lại dần đặt lên trên kệ gỗ rất phù hợp. ', 2300000, 100, 'chim công, hoa đào, phù dung', 'Phối màu, nền vàng', 'Sứ cao cấp ', 'Cao 35 cm', '12 tháng'),
(5, 1, 2, 'BÌNH HÚT LỘC NHỊ CẢNH BÁCH NHI BÁCH PHÚC 35CM', 'Bình tài lộc xét về hình dáng miệng loe rộng, giữa cổ thắt lại thân dưới phình to đến cực đại và điểm cuối thu nhỏ lại dần đặt lên trên kệ gỗ rất phù hợp.', 4800000, 100, 'Bách nhi đồ, bách nhi bách phúc', 'Phối màu', ' Sứ cao cấp vẽ vàng 24k', 'Cao 35 cm', '12 tháng'),
(6, 1, 2, 'BÌNH TÀI LỘC HOÀNG LONG NHẢ NGỌC CAO 30CM', 'Với hình dáng như vậy thì bình tài lộc đã nói lên được giá trị của nó là vừa hút Tài Lộc lại vừa giữ Tài Lộc rất tốt. Người ta tin rằng sở hữu bình tài lộc trong nhà sẽ kích hoạt sinh khí, mang lại nhiều may mắn và tài vận cho gia chủ.', 2280000, 100, 'Rồng nổi', 'Men vàng', 'Sứ cao cấp ', 'Cao 30 cm', '12 tháng'),
(7, 2, 2, 'BÌNH GỐM KHẮC HOA CAO CẤP 35CM', 'Bình gốm khắc hoa cao cấp 35cm với kiểu dáng lạ mắt bình cắm hoa đẹp này còn có thể trưng bày như một bình gốm trang trí phòng khách, trang trí kệ ti vi, phòng làm việc…', 3000000, 100, 'Khắc hoa dây nổi', 'Vàng da lươn, vàng đất', 'Sứ cao cấp ', 'Cao 35 cm', '12 tháng'),
(8, 2, 2, 'TỎI CẢNH QUÊ SƠN MÀI', 'Lọ sơn mài Bát Tràng được làm bằng phương pháp thủ công truyền thống, kiểu dáng hiện đại kết hợp hoa văn vẽ cảnh đồng quê thuần Việt tạo nét độc đáo cho sản phẩm.', 2300000, 100, 'Vẽ cảnh quê', 'Sơn mài', 'Sứ cao cấp', 'Cao 66cm, đường kính 45cm', '12 tháng'),
(9, 2, 2, 'LỌ TỎI SƠN MÀI HOA PHÙ DUNG', 'Đóa hoa Phù Dung được rất nhiều người yêu thích bởi vẻ đẹp tinh tế, đáng yêu của nó. Buổi sáng hoa Phù Dung nở ra có màu thanh khiết, đến trưa từ từ chuyển sang hồng rồi hồng đậm… ', 2200000, 100, 'Hoa Sen khảm bạc', 'Sơn mài', 'Sứ cao cấp ', 'Cao 53 cm', '12 tháng'),
(10, 2, 2, 'BỘ 3 BÌNH TRANG TRÍ MÀU ĐEN TRẮNG', 'Bộ 3 bình trang trí đen và trắng này có thế trưng bày trang trí phòng khách trên giá kệ tivi, giá kệ phòng làm việc phong cách hiện đai', 1500000, 99, 'Hoa Dây', 'Trắng, đen', 'Sứ cao cấp ', 'Cao 30-20-10 cm', '12 tháng'),
(11, 2, 2, 'VÒ CẮM HOA MEN RẠN CAO 26 CM', 'Vò cắm hoa men rạn cao 26 cm gốm sứ Bát Tràng cao cấp', 1500000, 100, 'Vẽ Hoa', 'Men rạn', 'Sứ cao cấp ', 'Cao 26 cm, đường kính 26 cm', '12 tháng'),
(12, 3, 2, 'TRỨNG PHONG THỦY VẼ NHỊ CẢNH BÁCH NHI CAO 45CM', 'Trứng phong thủy vẽ nhị cảnh bách nhi cao 45cm là dòng sản phẩm cao cấp của Bát Tràng.\r\n', 7200000, 100, 'Nhị cảnh bách nhi đồ', 'Men phối màu', 'Sứ trắng men khử cao cấp', 'Cao 45 cm', '12 tháng'),
(13, 3, 2, 'TRỨNG SỨ CAO CẤP VẼ HOA SEN CAO 45 CM', 'Trứng sứ cao cấp vẽ hoa sen cao 45 cm là dòng sản phẩm cao cấp của Bát Tràng.\r\n\r\n', 7900000, 100, 'Hoa sen', 'Men phối màu', 'Sứ trắng men khử cao cấp', 'Cao 45 cm', '12 tháng'),
(14, 3, 2, 'TRỨNG BÁCH HOA PHÚ QUÝ GỐM SỨ BÁT TRÀNG 45CM', 'Trứng phong thuỷ có thể trưng bày phòng khách, phòng làm việc để mang lại may mắn, sự phát triển, sinh sôi nảy nở của công danh, sự nghiệp cũng nhưng thuận lợi trong kinh doanh, buôn bán.', 6800000, 100, 'Bách hoa phú quý', 'Ph', 'Sứ trắng khử', 'Cao 45 cm', '12 tháng'),
(15, 3, 2, 'TRỨNG PHONG THỦY CÁ CHÉP HOÁ RỒNG VẼ VÀNG H50', 'Trứng phong thủy cá chép hoá rồng vẽ vàng h50 sản phẩm men Lam cao cấp của Bát Tràng\r\n\r\n', 6800000, 100, 'Cá chép vượt vũ môn, cá chép hoá rồng', 'Men Lam vẽ vàng', 'Sứ trắng khử vẽ vàng 24k', 'Cao 50 cm', '12 tháng'),
(16, 3, 2, 'TRỨNG PHONG THỦY VẼ CÁ CHÉP HOA SEN CAO 40CM', 'Trứng phong thủy vẽ cá chép hoa sen cao 40cm', 5000000, 100, 'Cá chép hoa sen', 'Phối màu', 'Sứ cao cấp ', 'Cao 45 cm', '12 tháng'),
(17, 4, 2, 'HỒ LÔ GỐM SỨ MEN RẠN CỔ CAO 40 CM', 'Hồ lô gốm sứ men rạn cổ để trưng bày theo phong thuỷ mang lại sức khỏe và sự bình yên cho gia chủ. Bình hồ lô phong thuỷ gắn liền với hình ảnh trái bầu buộc trên chiếc gậy của ông Thọ, đây chính là biểu tượng của niềm vui, sức khoẻ và an lành.', 1300000, 100, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp ', 'Cao 40 cm', '12 tháng'),
(18, 4, 2, 'HỒ LÔ GỐM SỨ VẼ SƠN THUỶ CAO 60 CM', 'Hồ lô gốm sứ vẽ sơn thuỷ cao thường dùng để trưng bày để mang lại sức khỏe và sự bình yên cho gia chủ. Hồ lô phong thuỷ có hình trái bầu và luôn gắn liền với hình ảnh trên chiếc gậy của ông Thọ, đó chính là biểu tượng của sức khỏe, niềm vui và an lành.', 1600000, 1, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp', 'Cao 60 cm', '12 tháng'),
(19, 4, 2, 'BÌNH HỒ LÔ GỐM SỨ VẼ SƠN THUỶ 80 CM', 'Bình hồ lô sơn thuỷ dùng để trưng bày theo phong thuỷ mang lại sức khỏe và sự bình yên cho gia chủ. Hồ lô phong thuỷ có hình trái bầu và luôn gắn liền với hình ảnh buộc trên chiếc gậy của ông Thọ, đây chính là biểu tượng của niềm vui, sức khoẻ và an lành.', 2200000, 100, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp ', 'Cao 80 cm', '12 tháng'),
(20, 5, 2, 'ĐÈN NGỦ GỐM SƠN MÀI KHẢM HOA SEN', 'Đèn ngủ gốm sơn mài khảm hoa sen', 2200000, 100, 'Hoa sen', 'Vàng', 'Sứ sơn mài khảm trứng', 'Cao 55 cm', '12 tháng'),
(21, 5, 2, 'ĐÈN BÀN TRANG TRÍ GỐM SỨ CAO CẤP', 'Đèn bàn trang trí gốm sứ cao cấp, sản phẩm hanmade của làng nghề Bát Tràng. Chiếc đèn ngủ gốm sứ này vừa có thể sử dụng thắp sáng vừa làm vật trang trí đẹp mắt cho phòng khách, phòng ngủ nhà bạn', 3900000, 100, 'Hoa Dây', 'Xanh lam', 'Sứ khử cao cấp', 'Cao 55 cm', '12 tháng'),
(22, 5, 2, 'ĐÈN NGỦ GỐM SỨ VẼ HOA THIÊN ĐIỂU', 'Đèn ngủ gốm sứ vẽ hoa thiên điểu, hàng thủ công của Bát Tràng.Thân đèn được chế tác từ chiếc bình hoa bằng gốm hoạ tiết vẽ tay đẹp mắt. Chiếc đèn ngủ có thể sử dụng làm đèn ngủ gia đình, đèn ngủ cho đôi vợ chồng mới cưới, đèn ngủ cho khách sạn,...', 1650000, 100, 'Hoa thiên điểu', 'Phối màu', 'Sứ cao cấp ', 'Cao 60 cm', '12 tháng'),
(23, 6, 2, 'TRANH BỘ LÝ NGƯ VỌNG NGUYỆT GỐM SỨ 50×1 M', 'Tranh bộ lý ngư vọng nguyệt gốm sứ 50×1 m ', 3600000, 100, 'Cá chép, lý ngư vọng nguyệt', 'Phối màu', 'Sứ cao cấp', '50 cm x 1 m', '12 tháng'),
(24, 6, 2, 'TRANH TỨ CẢNH ĐẮP NỔI KỸ MEN CHÀM 45×90 CM', 'Tranh Tứ quý thuộc loại tranh bốn bức vẽ cảnh bốn mùa là xuân, hạ, thu, đông. Mọi người treo tranh tứ quý không chỉ là để trang trí mà còn mang nhiều ý nghĩa mong cầu may mắn, phú quý, sung túc và mang cả những yếu tố phong thủy trong đó.', 4800000, 99, 'Đắp nổi Tùng cúc trúc mai', 'Men chàm cổ', 'Sứ cao cấp ', '45 cm x 90 cm', '12 tháng'),
(25, 6, 2, 'TRANH TỨ QUÝ TÙNG CÚC TRÚC MAI NỔI 0,5×1 M', 'Kích thước chi tiết  52 cm x 120 cm tính cả khung.', 3800000, 99, 'Vẽ cảnh Tứ Quý ', '50 cm x 98 cm', 'Sứ cao cấp ', '', 'Men bóng, phối màu'),
(26, 6, 2, 'TRANH PHONG THỦY CỬU NGƯ QUẦN HỘI MEN LAM', 'Tranh phong thủy Cửu ngư quần hội men Lam', 1860000, 100, 'Vẽ Cửu ngư quần hội', 'Men Lam ', 'Sứ cao cấp ', '64 cm x 98 cm', '12 tháng'),
(27, 6, 2, 'TRANH ỐP TƯỜNG GỐM BÁT TRÀNG VẼ CẢNH CHỢ QUÊ', 'Tranh ốp tường gốm bát tràng vẽ cảnh chợ quê gốm bát tràng', 3900000, 97, 'Phong cảnh chợ quê', 'Phối màu', 'Sứ cao cấp ', 'Tuỳ chỉnh', '12 tháng'),
(28, 7, 2, 'TƯỢNG TAM ĐA CAO 100 CM – HÀNG KỸ', 'Ba ông Phúc, Lộc,Thọ đã nhắn nhủ người đời rằng hạnh phúc ở đời suy cho cùng cũng chỉ là tương đối thôi. Không điều gì mãn nguyện tròn đầy và bền vững cả.Ngày Xuân xin chúc mọi người chúng ta hưởng Phúc–Lộc–Thọ với tất cả minh triết của “Tam đa”', 15800000, 99, 'Tượng Phúc Lộc Thọ, Tam đa', 'Men rạn cổ', 'Sứ cao cấp ', 'Cao 100 cm', '12 tháng'),
(29, 7, 2, 'TƯỢNG NGHÊ GỐM SỨ BÁT TRÀNG CAO 35 CM', 'Tượng nghê gốm sứ Bát Tràng cao 35 cm\r\n\r\n', 6000000, 99, 'Nghê sứ', 'Men xanh ngọc', 'Sứ cao cấp ', 'Cao 35 cm', '12 tháng'),
(30, 7, 2, 'TƯỢNG PHÚC LỘC THỌ TỨ LINH – CAO 86CM', 'Tượng phúc lộc thọ tứ linh – cao 86cm', 2000000, 96, 'Tượng Phúc Lộc Thọ, Tam đa', 'Men rạn cổ', 'Sứ cao cấp ', 'Cao 86 cm', '12 tháng'),
(31, 7, 2, 'TƯỢNG KHỔNG MINH MEN RẠN CAO 40 CM', 'Khổng minh Gia Cát lượng là một vị quân sư nổi tiếng dưới trướng phù trợ cho Lưu Bị. Ông là một vị quân sư được coi là tài giỏi nhất trong lịch sử trung quốc, với tài thao binh khiển tướng và dùng kế sách giúp Nhà Hán tranh giành thiên hạ', 1250000, 95, 'Khổng Minh, Gia Cát Lượng', 'Men rạn', 'Sứ cao cấp ', 'Cao 40 cm', '12 tháng'),
(32, 8, 2, 'ĐĨA SỨ VẼ CẢNH TRẺ THƠ VUI ĐÙA PHI 30 CM', 'Đĩa sứ vẽ cảnh trẻ thơ vui đùa phi 30', 900000, 96, 'Vẽ cảnh trẻ thơ vui đùa', 'Men lam', 'Sứ cao cấp', 'Phi 30', '12 tháng'),
(33, 8, 2, 'ĐĨA CẢNH TÙNG LỘC MEN LAM PHI 35 CM', 'Đĩa cảnh Tùng Lộc men Lam phi 35 cm mang nhiều giá trị nghệ thuật và ý nghĩa phong thủy. Người ta trưng bày đĩa cảnh Tùng lộc trong nhà sẽ đem lại nhiều may mắn tài lộc.', 1350000, 93, 'Tùng Lộc', 'Men Lam', 'Sứ cao cấp ', 'Đường kính 35 cm', '12 tháng'),
(34, 8, 2, 'ĐĨA CẢNH SỨ MÃ ĐÁO THÀNH CÔNG PHI 35 CM', 'Đĩa cảnh sứ mã đáo mang nhiều ý nghĩa về thành công trong kinh doanh, thắng lợi trong chiến trận với hình ảnh mã đáo là ngựa quay về. Đĩa cảnh mã đáo thành công là tranh vẽ về một bầy ngựa thường gồm tám con ngựa đang phi nước đại tiến về một hướng', 9000000, 22, 'Mã đáo thành công', 'Men giả cổ', 'Sứ cao cấp ', 'Đường kính 35 cm', '12 tháng'),
(35, 8, 2, 'ĐĨA SỨ VẼ KIM KÊ ĐỘC LẬP GIẢ CỔ 35 CM', 'Đĩa sứ vẽ Kim kê độc lập giả cổ  rất nhiều giá trị nghệ thuật và ý nghĩa phong thủy. Gà là một trong 12 con giáp, là một dấu tích của nền văn minh và văn hóa nông nghiệp ', 900000, 93, 'Kim kê độc lập', 'Men rạn cổ', 'Sứ cao cấp ', 'Đường kính 35cm', '12 tháng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vai_tro`
--

CREATE TABLE `vai_tro` (
  `id` bigint(20) NOT NULL,
  `ten_vai_tro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vai_tro`
--

INSERT INTO `vai_tro` (`id`, `ten_vai_tro`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MEMBER'),
(7, 'ROLE_EMPLOYEE');

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
  ADD KEY `FKgndcrlvetoudr3jaif9b7ay37` (`ma_shipper`),
  ADD KEY `FK5d0ivtt887a9birqbsr3hqyde` (`ma_employee`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `hang_san_xuat`
--
ALTER TABLE `hang_san_xuat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `vai_tro`
--
ALTER TABLE `vai_tro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `FK5d0ivtt887a9birqbsr3hqyde` FOREIGN KEY (`ma_employee`) REFERENCES `nguoi_dung` (`id`),
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
