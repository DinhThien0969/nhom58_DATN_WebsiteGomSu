package com.potteryshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.potteryshop.entities.ChiTietDonHang;
import com.potteryshop.entities.DanhMuc;
import com.potteryshop.entities.HangSanXuat;
import com.potteryshop.repository.ChiMucGioHangRepository;
import com.potteryshop.repository.ChiTietDonHangRepository;
import com.potteryshop.service.ChiTietDonHangService;

@Service
public class ChiTietDonHangServiceImpl implements ChiTietDonHangService{
	
	@Autowired
	private ChiTietDonHangRepository repo;
	
	@Override
	public List<ChiTietDonHang> save(List<ChiTietDonHang> list)
	{	
		return repo.saveAll(list);
	}

	@Override
	public List<ChiTietDonHang> listAll(List<ChiTietDonHang> list) {
		
		return repo.findAll(Sort.by("id").ascending());
	}

}
