package com.potteryshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.potteryshop.entities.SanPham;

public interface QueryRepository extends JpaRepository<SanPham, Long>{
	@Query(value = "select sum(dh.tong_gia_tri) from don_hang dh\r\n"
			+ "where month(dh.ngay_nhan_hang) = MONTH(CURRENT_DATE()) AND dh.trang_thai_don_hang = 'Hoan thanh';",nativeQuery = true)
	public int tongDoanhThuThang();
	
	@Query(value = "select count(nd.id) from nguoi_dung nd,nguoidung_vaitro ndvt\r\n"
			+ "where nd.id = ndvt.ma_nguoi_dung\r\n"
			+ "and ndvt.ma_vai_tro = 7;",nativeQuery = true)
	public int tongSoLuongNhanVien();
	
	@Query(value = "select count(sp.id) from san_pham sp;",nativeQuery = true)
	public int tongSoLuongMatHang();
	
	@Query(value = "select sum(dh.tong_gia_tri) from don_hang dh\r\n"
			+ "where date(dh.ngay_nhan_hang) = CURRENT_DATE AND dh.trang_thai_don_hang = 'Hoan thanh';",nativeQuery = true)
	public int tongDoanhThuTheoNgay();

	
	@Query(value = "SELECT COUNT(dh.ngay_nhan_hang) FROM don_hang dh WHERE date(dh.ngay_nhan_hang) = date(CURRENT_DATE()) and trang_thai_don_hang = \"Hoàn thành\";",nativeQuery = true)
	public int sodonhoanthanh();
}
