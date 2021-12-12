package com.potteryshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.potteryshop.entities.ChiMucGioHang;
import com.potteryshop.entities.GioHang;
import com.potteryshop.entities.SanPham;

public interface ChiMucGioHangRepository extends JpaRepository<ChiMucGioHang, Long>{
	
	ChiMucGioHang findBySanPhamAndGioHang(SanPham sp,GioHang g);
	
	List<ChiMucGioHang> findByGioHang(GioHang g);
}
