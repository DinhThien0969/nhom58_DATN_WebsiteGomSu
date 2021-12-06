package com.potteryshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import com.potteryshop.entities.DonHang;
import com.potteryshop.entities.NguoiDung;

public interface DonHangRepository extends JpaRepository<DonHang, Long>, QuerydslPredicateExecutor<DonHang> {

	public List<DonHang> findByTrangThaiDonHangAndEmployee(String trangThai, NguoiDung employee);

	@Query(value = "select DATE_FORMAT(dh.ngayNhanHang, '%m') as month, "
			+ " DATE_FORMAT(dh.ngayNhanHang, '%Y') as year, sum(ct.soLuongNhanHang * ct.donGia) as total "
			+ " from DonHang dh, ChiTietDonHang ct"
			+ " where dh.id = ct.donHang.id and dh.trangThaiDonHang ='Hoàn thành'"
			+ " group by DATE_FORMAT(dh.ngayNhanHang, '%Y%m')"
			+ " order by year asc" )
	public List<Object> layDonHangTheoThangVaNam();
	
	public List<DonHang> findByNguoiDat(NguoiDung ng);
	
	public int countByTrangThaiDonHang(String trangThaiDonHang);
	// thống kê repo
		@Query(value = "select month(dh.ngay_nhan_hang) ,\r\n"
				+ "year(dh.ngay_nhan_hang ),\r\n"
				+ "ctdh.ma_san_pham,\r\n"
				+ "sp.ten_san_pham,\r\n"
				+ "ctdh.don_gia,\r\n"
				+ "ctdh.so_luong_nhan_hang,\r\n"
				+ "ctdh.don_gia*ctdh.so_luong_nhan_hang \"doanh_thu\"\r\n"
				+ "from chi_tiet_don_hang ctdh,don_hang dh,san_pham sp\r\n"
				+ "where ctdh.ma_don_hang = dh.id\r\n"
				+ "and sp.id = ctdh.ma_san_pham\r\n"
				+ "and dh.trang_thai_don_hang = 'hoàn thành'\r\n"
				+ "and month(dh.ngay_nhan_hang) like ? -- \r\n"
				+ "order by doanh_thu desc\r\n"
				+ "limit 3",nativeQuery = true)
		public List<Object> top4DoanhThuSanPhamTheoThang(Integer thang);
		
		@Query(value = "select month(dh.ngay_nhan_hang) ,\r\n"
				+ "			year(dh.ngay_nhan_hang ),\r\n"
				+ "			ctdh.ma_san_pham,\r\n"
				+ "			sp.ten_san_pham,\r\n"
				+ "			ctdh.don_gia,\r\n"
				+ "			ctdh.so_luong_nhan_hang,\r\n"
				+ "			ctdh.don_gia*ctdh.so_luong_nhan_hang \"doanh_thu\"\r\n"
				+ "			from chi_tiet_don_hang ctdh,don_hang dh,san_pham sp\r\n"
				+ "			where ctdh.ma_don_hang = dh.id\r\n"
				+ "			and sp.id = ctdh.ma_san_pham\r\n"
				+ "			and dh.trang_thai_don_hang = 'hoàn thành'\r\n"
				+ "		    and month(dh.ngay_nhan_hang) like ? \r\n"
				+ "			order by doanh_thu desc\r\n"
				+ "			limit 3\r\n"
				+ "",nativeQuery = true)
		public List<Object> top4SoLuongSanPhamTheoThang(Integer thang);
	
}
