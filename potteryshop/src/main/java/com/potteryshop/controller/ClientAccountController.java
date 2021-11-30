package com.potteryshop.controller;

import java.util.ArrayList;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.common.collect.Lists;
import com.potteryshop.dto.PasswordDTO;
import com.potteryshop.entities.ChiMucGioHang;
import com.potteryshop.entities.DonHang;
import com.potteryshop.entities.GioHang;
import com.potteryshop.entities.NguoiDung;
import com.potteryshop.entities.ResponseObject;
import com.potteryshop.entities.SanPham;
import com.potteryshop.service.ChiMucGioHangService;
import com.potteryshop.service.DonHangService;
import com.potteryshop.service.GioHangService;
import com.potteryshop.service.NguoiDungService;
import com.potteryshop.service.SanPhamService;

@Controller
@SessionAttributes("loggedInUser")
@RequestMapping("/")

public class ClientAccountController {
	
	@Autowired
	private SanPhamService sanPhamService;

	@Autowired
	private NguoiDungService nguoiDungService;
	
	@Autowired
	private DonHangService donHangService;
	
	@Autowired
	private GioHangService gioHangService;
	@Autowired
	private ChiMucGioHangService chiMucGioHangService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
	
	@GetMapping("/account")
	public String accountPage(HttpServletRequest res, Model model) {
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
		
		model.addAttribute("user", currentUser);
		List<DonHang> list = Lists.reverse(donHangService.getDonHangByNguoiDung(currentUser));
		model.addAttribute("list",list);
		return "client/account";
	}	
	 
	@GetMapping("/changeInformation")
	public String clientChangeInformationPage(HttpServletRequest res,Model model) {
		NguoiDung currentUser = getSessionUser(res);
		model.addAttribute("user", currentUser);
		return "client/information";
	}

	@GetMapping("/changePassword")
	public String clientChangePasswordPage() {
		return "client/passwordChange";
	}
	
	@PostMapping("/updateInfo")
	@ResponseBody
	public ResponseObject commitChange(HttpServletRequest res,@RequestBody NguoiDung ng) {
		NguoiDung currentUser = getSessionUser(res);
		currentUser.setHoTen(ng.getHoTen());
		currentUser.setSoDienThoai(ng.getSoDienThoai());
		currentUser.setDiaChi(ng.getDiaChi());
		nguoiDungService.updateUser(currentUser);
		return new ResponseObject();
	}
	
	@PostMapping("/updatePassword")
	@ResponseBody
	public ResponseObject passwordChange(HttpServletRequest res,@RequestBody PasswordDTO dto) {
		NguoiDung currentUser = getSessionUser(res);
if (!passwordEncoder.matches( dto.getOldPassword(), currentUser.getPassword())) {
			ResponseObject re = new ResponseObject();
			re.setStatus("old");
			return re;
		}
		nguoiDungService.changePass(currentUser, dto.getNewPassword());
		return new ResponseObject();
	}

}
