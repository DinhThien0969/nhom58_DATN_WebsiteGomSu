package com.potteryshop.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.potteryshop.entities.ChiTietDonHang;
import com.potteryshop.entities.HangSanXuat;

public interface ChiTietDonHangService {
	List<ChiTietDonHang> save(List<ChiTietDonHang> list);

	List<ChiTietDonHang> listAll(List<ChiTietDonHang> list);
}
