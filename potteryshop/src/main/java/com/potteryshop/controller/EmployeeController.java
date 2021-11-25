package com.potteryshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.potteryshop.entities.NguoiDung;
import com.potteryshop.service.DanhMucService;
import com.potteryshop.service.DonHangService;
import com.potteryshop.service.HangSanXuatService;
import com.potteryshop.service.NguoiDungService;

@Controller
@RequestMapping("/employee")
@SessionAttributes("loggedInUser")
public class EmployeeController {
	
	
	@Autowired
	private NguoiDungService nguoiDungService;
	@Autowired
	private DanhMucService danhMucService;

	@Autowired
	private HangSanXuatService hangSXService;
	
	@Autowired
	private DonHangService donHangService;
	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung user = nguoiDungService.findByEmail(auth.getName());
		return user;
	}
	
	
	@GetMapping(value= {"", "/don-hang"})
	public String employeePage(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		NguoiDung user = nguoiDungService.findByEmail(auth.getName());
		user.setListDonHang(donHangService.findByTrangThaiDonHangAndEmployee("Đang giao", user));
		model.addAttribute("employee", user);

		return "employee/quanLyDonHang";
	}
	
	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
		System.out.println(getSessionUser(request).toString());
		return "employee/profile";
	}
	
	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute NguoiDung nd, HttpServletRequest request) {
		NguoiDung currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/employee/profile";
	}
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
	@GetMapping("/san-pham")
	public String quanLySanPhamPage(Model model) {
		model.addAttribute("listNhanHieu", hangSXService.getALlHangSX());
		model.addAttribute("listDanhMuc", danhMucService.getAllDanhMuc());
		return "employee/quanLySanPham";
	}
	@GetMapping("/danh-muc")
	public String quanLyDanhMucPage() {
		return "employee/quanLyDanhMuc";
	}

}
