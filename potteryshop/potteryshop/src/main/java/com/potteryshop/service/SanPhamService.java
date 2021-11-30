package com.potteryshop.service;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;

import com.potteryshop.dto.SanPhamDto;
import com.potteryshop.dto.SearchSanPhamObject;
import com.potteryshop.entities.SanPham;

public interface SanPhamService {

	SanPham save(SanPhamDto sp);

	SanPham update(SanPhamDto sp);

	void deleteById(long id);

	Page<SanPham> getAllSanPhamByFilter(SearchSanPhamObject object, int page, int limit);

	SanPham getSanPhamById(long id);
	
	List<SanPham> getLatestSanPham();
	
	Iterable<SanPham> getSanPhamByTenSanPhamWithoutPaginate(SearchSanPhamObject object);
	
	Page<SanPham> getSanPhamByTenSanPham(SearchSanPhamObject object,int page, int resultPerPage);
	
	List<SanPham> getAllSanPhamByList(Set<Long> idList);
	
	Page<SanPham> getSanPhamByTenSanPhamForAdmin(String tenSanPham, int page, int size);
	
	Iterable<SanPham> getSanPhamByTenDanhMuc(String brand);
	
	public Page<SanPham> getSanPhamByBrand(SearchSanPhamObject object, int page, int resultPerPage);
}
