package com.potteryshop.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.potteryshop.dto.SearchSanPhamObject;
import com.potteryshop.entities.ChiMucGioHang;
import com.potteryshop.entities.DanhMuc;
import com.potteryshop.entities.GioHang;
import com.potteryshop.entities.LienHe;
import com.potteryshop.entities.NguoiDung;
import com.potteryshop.entities.ResponseObject;
import com.potteryshop.entities.SanPham;
import com.potteryshop.service.ChiMucGioHangService;
import com.potteryshop.service.DanhMucService;
import com.potteryshop.service.GioHangService;
import com.potteryshop.service.LienHeService;
import com.potteryshop.service.NguoiDungService;
import com.potteryshop.service.SanPhamService;

@Controller
@SessionAttributes("loggedInUser")
@RequestMapping("/")
public class ClientController {

	@Autowired
	private SanPhamService sanPhamService;

	@Autowired
	private NguoiDungService nguoiDungService;
	
	@Autowired
	private DanhMucService danhMucService;
	
	@Autowired
	private LienHeService lienHeService;
	@Autowired
	private ChiMucGioHangService chiMucGioHangService;
	@Autowired
	private GioHangService gioHangService;
	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser(boolean isBlocked) {
		
		if(!isBlocked) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			
			return nguoiDungService.findByEmail(auth.getName());
		} else return null;
	}
	
	@ModelAttribute("listDanhMuc")
	public List<DanhMuc> listDanhMuc(){
		return danhMucService.getAllDanhMuc();
	}

	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}

	@GetMapping("/*")
	public String clientPage(HttpServletRequest res,Model model) {
		NguoiDung currentUser = getSessionUser(res);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Map<Long,String> quanity = new HashMap<Long,String>();
		Map<Long,String> quanityNew = new HashMap<Long,String>();

		List<SanPham> listspNew = new ArrayList<SanPham>();
		List<SanPham> listspOld = new ArrayList<SanPham>();
		if(auth == null || auth.getPrincipal() == "anonymousUser")     //Lay tu cookie
		{
			
			Cookie cl[] = res.getCookies();	
			if(cl!=null) {	Set<Long> idList = new HashSet<Long>();
			for(int i=0; i< cl.length; i++)
			{
				if(cl[i].getName().matches("[0-9]+"))
				{
					idList.add(Long.parseLong(cl[i].getName()));
					quanity.put(Long.parseLong(cl[i].getName()), cl[i].getValue());  
				}
				
			}
			listspOld = sanPhamService.getAllSanPhamByList(idList);}
		
			
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
		
		
		
		System.out.println(loggedInUser(false));
		
		if(loggedInUser(false)!=null && loggedInUser(false).getIsBlocked()) {
			
			return "client/blockedPage";
		}
		else {
			return "client/home";
		}
	}

	@GetMapping("/login")
	public String loginPage() {
		return "client/login";
	}
	
	@GetMapping("/contact")
	public String contactPage() {
		return "client/contact";
	}
	
	@PostMapping("/createContact")
	@ResponseBody
	public ResponseObject createContact(@RequestBody LienHe lh)
	{
		lh.setNgayLienHe(new Date());
		lienHeService.save(lh);
		return new ResponseObject();
	}

	@GetMapping("/store")
	public String storePage(HttpServletRequest res,@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "") String range,@RequestParam(defaultValue = "") String brand,@RequestParam(defaultValue = "") String manufactor,@RequestParam(defaultValue = "") String thietke,@RequestParam(defaultValue = "") String mausac,@RequestParam(defaultValue = "") String kichthuoc,Model model) {		
		SearchSanPhamObject obj = new SearchSanPhamObject();
		obj.setBrand(brand);
		obj.setDonGia(range);
		obj.setManufactor(manufactor);
		obj.setThietke(thietke);
		obj.setMausac(mausac);
		obj.setKichthuoc(kichthuoc);
		Page<SanPham> list = sanPhamService.getSanPhamByBrand(obj,page,12);
		int totalPage = list.getTotalPages();
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("list",list.getContent());
		model.addAttribute("currentPage",page);
		model.addAttribute("range",range);
		model.addAttribute("brand",brand);
		model.addAttribute("manufactor",manufactor);
		model.addAttribute("thietke",thietke);
		model.addAttribute("mausac",mausac);
		model.addAttribute("kichthuoc",kichthuoc);
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
		Set<String> hangsx = new HashSet<String>();
		Set<String> pinSet = new HashSet<String>();
		Iterable<SanPham> dum = sanPhamService.getSanPhamByTenDanhMuc(brand);
		for(SanPham sp: dum)
		{
			hangsx.add(sp.getHangSanXuat().getTenHangSanXuat());
			if(brand.equals("BÌNH HOA - LỌ HOA"))
			{
				pinSet.add(sp.getKichThuoc());
			}
		}
		model.addAttribute("hangsx",hangsx);
		model.addAttribute("pinSet",pinSet);
		
		
		
		
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
		
		return "client/store";
	}

	@GetMapping("/sp")
	public String detailspPage(@RequestParam int id, Model model) {
		SanPham sp = sanPhamService.getSanPhamById(id);
		model.addAttribute("sp", sp);
		return "client/detailsp";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@GetMapping("/shipping")
	public String shippingPage(Model model) {

		return "client/shipping";
	}

	@GetMapping("/guarantee")
	public String guaranteePage(Model model) {

		return "client/guarantee";
	}

}
