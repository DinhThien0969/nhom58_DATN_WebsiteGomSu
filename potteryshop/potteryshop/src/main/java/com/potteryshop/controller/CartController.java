package com.potteryshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.potteryshop.entities.ChiMucGioHang;
import com.potteryshop.entities.GioHang;
import com.potteryshop.entities.NguoiDung;
import com.potteryshop.entities.SanPham;
import com.potteryshop.service.ChiMucGioHangService;
import com.potteryshop.service.GioHangService;
import com.potteryshop.service.NguoiDungService;
import com.potteryshop.service.SanPhamService;

@Controller
@SessionAttributes("loggedInUser")
public class CartController {
	
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private NguoiDungService nguoiDungService;
	@Autowired
	private GioHangService gioHangService;
	@Autowired
	private ChiMucGioHangService chiMucGioHangService;
	
	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		return nguoiDungService.findByEmail(auth.getName());
	}
	
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
	
	@GetMapping("/cart")
	public String cartPage(HttpServletRequest res,Model model) {
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
		
		return "client/cart";
	}

}