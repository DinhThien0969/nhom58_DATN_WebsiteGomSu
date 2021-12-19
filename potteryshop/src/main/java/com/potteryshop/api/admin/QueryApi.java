package com.potteryshop.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.potteryshop.service.impl.QueryServiceImplement;

@RestController
@RequestMapping("api/queries")
public class QueryApi {
	
	@Autowired
	QueryServiceImplement QueryServiceImplement;
	
	@GetMapping("tongDoanhThuThang")
	public int tongDoanhThuThang() {
		return QueryServiceImplement.tongDoanhThuThang();
	}
	
	@GetMapping("tongSoLuongNhanVien")
	public int tongSoLuongNhanVien() {
		return QueryServiceImplement.tongSoLuongNhanVien();
	}
	
	@GetMapping("tongSoLuongMatHang")
	public int tongSoLuongMatHang() {
		return QueryServiceImplement.tongSoLuongMatHang();
	}
	@GetMapping("tongDoanhThuTheoNgay")
	public int tongDoanhThuTheoNgay() {
		return QueryServiceImplement.tongDoanhThuTheoNgay();
	}
	@GetMapping("sodonhoanthanh")
	public int sodonhoanthanh() {
		return QueryServiceImplement.sodonhoanthanh();
	}
}