package com.potteryshop;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.potteryshop.entities.DanhMuc;
import com.potteryshop.entities.DonHang;
import com.potteryshop.entities.NguoiDung;
import com.potteryshop.entities.VaiTro;
import com.potteryshop.repository.DonHangRepository;
import com.potteryshop.repository.NguoiDungRepository;
import com.potteryshop.service.DanhMucService;
import com.potteryshop.service.NguoiDungService;
import com.potteryshop.service.SanPhamService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PotteryShopTests {

	@Autowired
	private DanhMucService dmService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private NguoiDungRepository ndRepo;

	@Autowired
	private DonHangRepository dhRepo;
	
	@Autowired
	private SanPhamService spService;


//	@Test
//	public void getALlDanhMucTest() {
//		System.out.println(dhRepo.test().size());
//	}

	@Test
	public void getALlDanhMucTest() {
		System.out.println(spService.getSanPhamByTenSanPhamForAdmin("asus",0,10).getContent().size());
	}

}
