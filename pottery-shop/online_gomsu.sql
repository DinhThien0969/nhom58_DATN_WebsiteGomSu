-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 28, 2021 lúc 05:18 AM
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
-- Cơ sở dữ liệu: `online_gomsu`
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
(4, 1, 2, 11);

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
(1, 1500000, 1, 1, 11, 1, 1),
(2, 1500000, 1, 1, 10, 1, 1),
(3, 3600000, 1, 1, 23, 1, 1),
(4, 1500000, 1, 2, 10, 1, 0),
(5, 2200000, 1, 2, 19, 1, 0);

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
(1, '66 Mai Dịch, Cầu Giấy, Hà Nội', 'Ghi chú employee: \r\nĐã Hoàn thành<br> Ghi chú admin:\r\nĐã hoàn thành', 'Thiện', '2021-10-25 09:51:27', '2021-10-25 10:47:34', '2021-10-25 10:48:34', '0969753187', 'Hoàn thành', 6, 7, 6600000, NULL),
(2, 'HaNoi', NULL, 'Thiện', '2021-10-26 10:44:17', '2021-10-28 08:54:53', NULL, '0969753187', 'Đang giao', 6, NULL, 3700000, NULL);

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
(1, '5000000', 6),
(2, NULL, 7);

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
(3, 3),
(4, 2),
(5, 1),
(6, 2),
(7, 3),
(8, 3);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `dia_chi`, `email`, `ho_ten`, `password`, `so_dien_thoai`) VALUES
(1, NULL, 'admin@gmail.com', 'Nguyễn Xuân Nam', '$2a$10$/VFMNUPBKNVRMjxPFCYKZ.lKahoLQda0EaAxdqoun1w3DqwNLa2me', '123456789'),
(2, NULL, 'member@gmail.com', NULL, '$2a$10$j7Upgupou72GBmukz0G6pOATk3wlCAgaoFCEqAhSvLToD/V/1wlpu', NULL),
(3, NULL, 'shipper@gmail.com', NULL, '$2a$10$u2B29HDxuWVYY3fUJ8R2qunNzXngfxij5GpvlFAEtIz3JpK/WFXF2', NULL),
(4, 'Ha Noi', 'jvgiveup@gmail.com', 'Pham Tuan', '$2a$10$ZCqCO9gSWt8A8HNXAWq8luqfNbJm0uG3PsUlzry0aRLwO3VHQZTmy', '123456'),
(5, 'Hà Nội', 'trandinhthien0969@gmail.com', 'Trần Đình Thiện', '$2a$10$AmDvr9swPO.vtnImI3/0QuepqzRs0cvHPj0nI/CknAnTs7pwrkty2', '0969753187'),
(6, 'Hà Nội', 'thientdph10600@fpt.edu.vn', 'Đình Thiện', '$2a$10$ylYEFlgNmE3Zv8ckrabQbO4a/ex6PzulPpwp2HFvU/xUOAqaruMJa', '0969753187'),
(7, 'Hà Nội', 'thientdph10@fpt.edu.vn', 'Nhân viên Thiện', '$2a$10$046tyWEyIzvd4ldjqqiVgeyHTHYETUFLDFpHuwb/.1hJafWI/Igxm', '0969753187'),
(8, NULL, 'employee@gmail.com', NULL, '$2a$10$FAb6aUoLkmI7R.I3Dz4k2O6GWCxQ1u8BWe/MittlODkB5A.ZAvW7G', NULL);

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
(11, 2, 2, 'VÒ CẮM HOA MEN RẠN CAO 26 CM', 'Vò cắm hoa men rạn cao 26 cm gốm sứ Bát Tràng cao cấp', 1500000, 99, 'Vẽ Hoa', 'Men rạn', 'Sứ cao cấp ', 'Cao 26 cm, đường kính 26 cm', '12 tháng'),
(12, 3, 2, 'TRỨNG PHONG THỦY VẼ NHỊ CẢNH BÁCH NHI CAO 45CM', 'Trứng phong thủy vẽ nhị cảnh bách nhi cao 45cm là dòng sản phẩm cao cấp của Bát Tràng.\r\n', 7200000, 100, 'Nhị cảnh bách nhi đồ', 'Men phối màu', 'Sứ trắng men khử cao cấp', 'Cao 45 cm', '12 tháng'),
(13, 3, 2, 'TRỨNG SỨ CAO CẤP VẼ HOA SEN CAO 45 CM', 'Trứng sứ cao cấp vẽ hoa sen cao 45 cm là dòng sản phẩm cao cấp của Bát Tràng.\r\n\r\n', 7900000, 100, 'Hoa sen', 'Men phối màu', 'Sứ trắng men khử cao cấp', 'Cao 45 cm', '12 tháng'),
(14, 3, 2, 'TRỨNG BÁCH HOA PHÚ QUÝ GỐM SỨ BÁT TRÀNG 45CM', 'Trứng phong thuỷ có thể trưng bày phòng khách, phòng làm việc để mang lại may mắn, sự phát triển, sinh sôi nảy nở của công danh, sự nghiệp cũng nhưng thuận lợi trong kinh doanh, buôn bán.', 6800000, 100, 'Bách hoa phú quý', 'Ph', 'Sứ trắng khử', 'Cao 45 cm', '12 tháng'),
(15, 3, 2, 'TRỨNG PHONG THỦY CÁ CHÉP HOÁ RỒNG VẼ VÀNG H50', 'Trứng phong thủy cá chép hoá rồng vẽ vàng h50 sản phẩm men Lam cao cấp của Bát Tràng\r\n\r\n', 6800000, 100, 'Cá chép vượt vũ môn, cá chép hoá rồng', 'Men Lam vẽ vàng', 'Sứ trắng khử vẽ vàng 24k', 'Cao 50 cm', '12 tháng'),
(16, 3, 2, 'TRỨNG PHONG THỦY VẼ CÁ CHÉP HOA SEN CAO 40CM', 'Trứng phong thủy vẽ cá chép hoa sen cao 40cm', 5000000, 100, 'Cá chép hoa sen', 'Phối màu', 'Sứ cao cấp ', 'Cao 45 cm', '12 tháng'),
(17, 4, 2, 'HỒ LÔ GỐM SỨ MEN RẠN CỔ CAO 40 CM', 'Hồ lô gốm sứ men rạn cổ để trưng bày theo phong thuỷ mang lại sức khỏe và sự bình yên cho gia chủ. Bình hồ lô phong thuỷ gắn liền với hình ảnh trái bầu buộc trên chiếc gậy của ông Thọ, đây chính là biểu tượng của niềm vui, sức khoẻ và an lành.', 1300000, 100, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp ', 'Cao 40 cm', '12 tháng'),
(18, 4, 2, 'HỒ LÔ GỐM SỨ VẼ SƠN THUỶ CAO 60 CM', 'Hồ lô gốm sứ vẽ sơn thuỷ cao thường dùng để trưng bày để mang lại sức khỏe và sự bình yên cho gia chủ. Hồ lô phong thuỷ có hình trái bầu và luôn gắn liền với hình ảnh trên chiếc gậy của ông Thọ, đó chính là biểu tượng của sức khỏe, niềm vui và an lành.', 1600000, 0, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp', 'Cao 60 cm', '12 tháng'),
(19, 4, 2, 'BÌNH HỒ LÔ GỐM SỨ VẼ SƠN THUỶ 80 CM', 'Bình hồ lô sơn thuỷ dùng để trưng bày theo phong thuỷ mang lại sức khỏe và sự bình yên cho gia chủ. Hồ lô phong thuỷ có hình trái bầu và luôn gắn liền với hình ảnh buộc trên chiếc gậy của ông Thọ, đây chính là biểu tượng của niềm vui, sức khoẻ và an lành.', 2200000, 100, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp ', 'Cao 80 cm', '12 tháng'),
(20, 5, 2, 'ĐÈN NGỦ GỐM SƠN MÀI KHẢM HOA SEN', 'Đèn ngủ gốm sơn mài khảm hoa sen', 2200000, 100, 'Hoa sen', 'Vàng', 'Sứ sơn mài khảm trứng', 'Cao 55 cm', '12 tháng'),
(21, 5, 2, 'ĐÈN BÀN TRANG TRÍ GỐM SỨ CAO CẤP', 'Đèn bàn trang trí gốm sứ cao cấp, sản phẩm hanmade của làng nghề Bát Tràng. Chiếc đèn ngủ gốm sứ này vừa có thể sử dụng thắp sáng vừa làm vật trang trí đẹp mắt cho phòng khách, phòng ngủ nhà bạn', 3900000, 100, 'Hoa Dây', 'Xanh lam', 'Sứ khử cao cấp', 'Cao 55 cm', '12 tháng'),
(22, 5, 2, 'ĐÈN NGỦ GỐM SỨ VẼ HOA THIÊN ĐIỂU', 'Đèn ngủ gốm sứ vẽ hoa thiên điểu, hàng thủ công của Bát Tràng.Thân đèn được chế tác từ chiếc bình hoa bằng gốm hoạ tiết vẽ tay đẹp mắt. Chiếc đèn ngủ có thể sử dụng làm đèn ngủ gia đình, đèn ngủ cho đôi vợ chồng mới cưới, đèn ngủ cho khách sạn,...', 1650000, 100, 'Hoa thiên điểu', 'Phối màu', 'Sứ cao cấp ', 'Cao 60 cm', '12 tháng'),
(23, 6, 2, 'TRANH BỘ LÝ NGƯ VỌNG NGUYỆT GỐM SỨ 50×1 M', 'Tranh bộ lý ngư vọng nguyệt gốm sứ 50×1 m ', 3600000, 99, 'Cá chép, lý ngư vọng nguyệt', 'Phối màu', 'Sứ cao cấp', '50 cm x 1 m', '12 tháng'),
(24, 6, 2, 'TRANH TỨ CẢNH ĐẮP NỔI KỸ MEN CHÀM 45×90 CM', 'Tranh Tứ quý thuộc loại tranh bốn bức vẽ cảnh bốn mùa là xuân, hạ, thu, đông. Mọi người treo tranh tứ quý không chỉ là để trang trí mà còn mang nhiều ý nghĩa mong cầu may mắn, phú quý, sung túc và mang cả những yếu tố phong thủy trong đó.', 4800000, 100, 'Đắp nổi Tùng cúc trúc mai', 'Men chàm cổ', 'Sứ cao cấp ', '45 cm x 90 cm', '12 tháng'),
(25, 6, 2, 'TRANH TỨ QUÝ TÙNG CÚC TRÚC MAI NỔI 0,5×1 M', 'Kích thước chi tiết  52 cm x 120 cm tính cả khung.', 3800000, 100, 'Vẽ cảnh Tứ Quý ', '50 cm x 98 cm', 'Sứ cao cấp ', '', 'Men bóng, phối màu'),
(26, 6, 2, 'TRANH PHONG THỦY CỬU NGƯ QUẦN HỘI MEN LAM', 'Tranh phong thủy Cửu ngư quần hội men Lam', 1860000, 100, 'Vẽ Cửu ngư quần hội', 'Men Lam ', 'Sứ cao cấp ', '64 cm x 98 cm', '12 tháng'),
(27, 6, 2, 'TRANH ỐP TƯỜNG GỐM BÁT TRÀNG VẼ CẢNH CHỢ QUÊ', 'Tranh ốp tường gốm bát tràng vẽ cảnh chợ quê gốm bát tràng', 3900000, 100, 'Phong cảnh chợ quê', 'Phối màu', 'Sứ cao cấp ', 'Tuỳ chỉnh', '12 tháng'),
(28, 7, 2, 'TƯỢNG TAM ĐA CAO 100 CM – HÀNG KỸ', 'Ba ông Phúc, Lộc,Thọ đã nhắn nhủ người đời rằng hạnh phúc ở đời suy cho cùng cũng chỉ là tương đối thôi. Không điều gì mãn nguyện tròn đầy và bền vững cả.Ngày Xuân xin chúc mọi người chúng ta hưởng Phúc–Lộc–Thọ với tất cả minh triết của “Tam đa”', 15800000, 100, 'Tượng Phúc Lộc Thọ, Tam đa', 'Men rạn cổ', 'Sứ cao cấp ', 'Cao 100 cm', '12 tháng'),
(29, 7, 2, 'TƯỢNG NGHÊ GỐM SỨ BÁT TRÀNG CAO 35 CM', 'Tượng nghê gốm sứ Bát Tràng cao 35 cm\r\n\r\n', 6000000, 100, 'Nghê sứ', 'Men xanh ngọc', 'Sứ cao cấp ', 'Cao 35 cm', '12 tháng'),
(30, 7, 2, 'TƯỢNG PHÚC LỘC THỌ TỨ LINH – CAO 86CM', 'Tượng phúc lộc thọ tứ linh – cao 86cm', 0, 100, 'Tượng Phúc Lộc Thọ, Tam đa', 'Men rạn cổ', 'Sứ cao cấp ', 'Cao 86 cm', '12 tháng'),
(31, 7, 2, 'TƯỢNG KHỔNG MINH MEN RẠN CAO 40 CM', 'Khổng minh Gia Cát lượng là một vị quân sư nổi tiếng dưới trướng phù trợ cho Lưu Bị. Ông là một vị quân sư được coi là tài giỏi nhất trong lịch sử trung quốc, với tài thao binh khiển tướng và dùng kế sách giúp Nhà Hán tranh giành thiên hạ', 1250000, 100, 'Khổng Minh, Gia Cát Lượng', 'Men rạn', 'Sứ cao cấp ', 'Cao 40 cm', '12 tháng'),
(32, 8, 2, 'ĐĨA SỨ VẼ CẢNH TRẺ THƠ VUI ĐÙA PHI 30', 'Đĩa sứ vẽ cảnh trẻ thơ vui đùa phi 30', 900000, 100, 'Vẽ cảnh trẻ thơ vui đùa', 'Men lam', 'Sứ cao cấp', 'Phi 30', '12 tháng'),
(33, 8, 2, 'ĐĨA CẢNH TÙNG LỘC MEN LAM PHI 35 CM', 'Đĩa cảnh Tùng Lộc men Lam phi 35 cm mang nhiều giá trị nghệ thuật và ý nghĩa phong thủy. Người ta trưng bày đĩa cảnh Tùng lộc trong nhà sẽ đem lại nhiều may mắn tài lộc.', 1350000, 100, 'Tùng Lộc', 'Men Lam', 'Sứ cao cấp ', 'Đường kính 35 cm', '12 tháng'),
(34, 8, 2, 'ĐĨA CẢNH SỨ MÃ ĐÁO THÀNH CÔNG PHI 35 CM', 'Đĩa cảnh sứ mã đáo mang nhiều ý nghĩa về thành công trong kinh doanh, thắng lợi trong chiến trận với hình ảnh mã đáo là ngựa quay về. Đĩa cảnh mã đáo thành công là tranh vẽ về một bầy ngựa thường gồm tám con ngựa đang phi nước đại tiến về một hướng', 0, 0, 'Mã đáo thành công', 'Men giả cổ', 'Sứ cao cấp ', 'Đường kính 35 cm', '12 tháng'),
(35, 8, 2, 'ĐĨA SỨ VẼ KIM KÊ ĐỘC LẬP GIẢ CỔ 35CM', 'Đĩa sứ vẽ Kim kê độc lập giả cổ  rất nhiều giá trị nghệ thuật và ý nghĩa phong thủy. Gà là một trong 12 con giáp, là một dấu tích của nền văn minh và văn hóa nông nghiệp ', 900000, 100, 'Kim kê độc lập', 'Men rạn cổ', 'Sứ cao cấp ', 'Đường kính 35cm', '12 tháng');

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
(3, 'ROLE_EMPLOYEE'),
(5, 'ROLE_SHIPPER');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hang_san_xuat`
--
ALTER TABLE `hang_san_xuat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `vai_tro`
--
ALTER TABLE `vai_tro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
