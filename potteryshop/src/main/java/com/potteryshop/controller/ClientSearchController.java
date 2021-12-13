package com.potteryshop.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.potteryshop.dto.SearchSanPhamObject;
import com.potteryshop.entities.ChiMucGioHang;
import com.potteryshop.entities.GioHang;
import com.potteryshop.entities.NguoiDung;
import com.potteryshop.entities.SanPham;
import com.potteryshop.service.ChiMucGioHangService;
import com.potteryshop.service.GioHangService;
import com.potteryshop.service.NguoiDungService;
import com.potteryshop.service.SanPhamService;

@Controller
public class ClientSearchController {
	
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private GioHangService gioHangService;
	@Autowired
	private ChiMucGioHangService chiMucGioHangService;
	
	@Autowired
	NguoiDungService nguoiDungService;
	
	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser(boolean isBlocked) {

		if (!isBlocked) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();

			return nguoiDungService.findByEmail(auth.getName());
		} else
			return null;
	}
	
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
	
	@GetMapping("search")
	public String searchSP(HttpServletRequest res,@RequestParam(defaultValue = "1") int page,@RequestParam String name,@RequestParam(defaultValue = "") String sort,@RequestParam(defaultValue = "") String range,@RequestParam(defaultValue = "") String brand,@RequestParam(defaultValue = "") String manufactor,Model model) {
		SearchSanPhamObject obj = new SearchSanPhamObject();
		obj.setKeyword(name.split(" "));
		obj.setSort(sort);
		obj.setDonGia(range);
		obj.setBrand(brand);
		obj.setManufactor(manufactor);
		Page<SanPham> list = sanPhamService.getSanPhamByTenSanPham(obj,page,12);
		int totalPage = list.getTotalPages();
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("list",list.getContent());
		model.addAttribute("currentPage",page);
		model.addAttribute("name",name);
		model.addAttribute("sort",sort);
		model.addAttribute("range",range);
		model.addAttribute("brand",brand);
		model.addAttribute("manufactor",manufactor);
		List<Integer> pagelist = new ArrayList<Integer>();
		
		//Lap ra danh sach cac trang
		if(page==1 || page ==2 || page == 3 || page == 4)
		{
			for(int i = 2; i <=5 && i<=totalPage; i++)
			{
				pagelist.add(i);
			}
		}else if(page == totalPage)
		{
			for(int i = totalPage; i >= totalPage - 3 && i> 1; i--)
			{
				pagelist.add(i);
			}
			Collections.sort(pagelist);
		}else
		{
			for(int i = page; i <= page + 2 && i<= totalPage; i++)
			{
				pagelist.add(i);
			}
			for(int i = page-1; i >= page - 2 && i> 1; i--)
			{
				pagelist.add(i);
			}
			Collections.sort(pagelist);
		}
		model.addAttribute("pageList",pagelist);
			
		//Lay cac danh muc va hang san xuat tim thay
		Set<String> danhmuc = new HashSet<String>();
		Set<String> hangsx = new HashSet<String>();
		Iterable<SanPham> dum = sanPhamService.getSanPhamByTenSanPhamWithoutPaginate(obj);
		for(SanPham sp: dum)
		{
			danhmuc.add(sp.getDanhMuc().getTenDanhMuc());
			hangsx.add(sp.getHangSanXuat().getTenHangSanXuat());
		}
		model.addAttribute("danhmuc",danhmuc);
		model.addAttribute("hangsx",hangsx);
		NguoiDung currentUser = getSessionUser(res);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Map<Long,String> quanity = new HashMap<Long,String>();
		Map<Long,String> quanityNew = new HashMap<Long,String>();

		List<SanPham> listspNew = new ArrayList<SanPham>();
		List<SanPham> listspOld = new ArrayList<SanPham>();
		if(auth == null || auth.getPrincipal() == "anonymousUser")     //Lay tu cookie
		{
			Cookie cl[] = res.getCookies();		
			Set<Long> idList = new HashSet<Long>();
			for(int i=0; i< cl.length; i++)
			{
				if(cl[i].getName().matches("[0-9]+"))
				{
					idList.add(Long.parseLong(cl[i].getName()));
					quanity.put(Long.parseLong(cl[i].getName()), cl[i].getValue());  
				}
				
			}
			listspOld = sanPhamService.getAllSanPhamByList(idList);
			
		}else     //Lay tu database
		{
			GioHang g = gioHangService.getGioHangByNguoiDung(currentUser);
			if(g != null)
			{
				List<ChiMucGioHang> listchimuc = chiMucGioHangService.getChiMucGioHangByGioHang(g);
				
				Cookie cl[] = res.getCookies();
Set<Long> idList = new HashSet<Long>();
				for(int i=0; i< cl.length; i++)
				{
					if(cl[i].getName().matches("[0-9]+"))
					{
						idList.add(Long.parseLong(cl[i].getName()));
						quanityNew.put(Long.parseLong(cl[i].getName()), cl[i].getValue());  
					}				
				}
				listspNew = sanPhamService.getAllSanPhamByList(idList);
				
				for(ChiMucGioHang c: listchimuc)
				{
					listspOld.add(c.getSanPham());
					quanity.put(c.getSanPham().getId(), Integer.toString(c.getSo_luong()));
				}
			}
		}
		model.addAttribute("checkEmpty",listspOld.size()+listspNew.size());
		model.addAttribute("cartOld",listspOld);
		
		model.addAttribute("cartNew",listspNew);
		model.addAttribute("quanityNew",quanityNew);
		model.addAttribute("quanity",quanity);
		
		if (loggedInUser(false) != null && loggedInUser(false).getIsBlocked()) {

			return "client/blockedPage";
		} else {
			return "client/searchResult";
		}
	}

}
