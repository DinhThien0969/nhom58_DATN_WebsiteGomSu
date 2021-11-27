package com.potteryshop.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.data.domain.Page;

import com.potteryshop.dto.SearchDonHangObject;
import com.potteryshop.entities.DonHang;
import com.potteryshop.entities.NguoiDung;

public interface DonHangService {

	Page<DonHang> getAllDonHangByFilter(SearchDonHangObject object, int page) throws ParseException;

	DonHang update(DonHang dh);
	
	DonHang findById(long id);
	
	Page<DonHang> findDonHangByEmployee(SearchDonHangObject object, int page, int size, NguoiDung employee) throws ParseException;

	DonHang save(DonHang dh);
	
	List<Object> layDonHangTheoThangVaNam();

	List<DonHang> findByTrangThaiDonHangAndEmployee(String string, NguoiDung employee);

	
	List<DonHang> getDonHangByNguoiDung(NguoiDung currentUser);
	
	int countByTrangThaiDonHang(String trangThaiDonHang);
    List<DonHang> fillAll();
}
