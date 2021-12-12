package com.potteryshop.service;

import com.potteryshop.entities.GioHang;
import com.potteryshop.entities.NguoiDung;

public interface GioHangService {
	
	GioHang getGioHangByNguoiDung(NguoiDung n);
	
	GioHang save(GioHang g);
}
