package com.potteryshop.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.DocumentException;
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

import com.potteryshop.dto.ListCongViecDTO;
import com.potteryshop.entities.DonHang;
import com.potteryshop.entities.EmployeePDF;
import com.potteryshop.entities.NguoiDung;
import com.potteryshop.entities.donhangPDFexporter;
import com.potteryshop.service.DanhMucService;
import com.potteryshop.service.DonHangService;
import com.potteryshop.service.HangSanXuatService;
import com.potteryshop.service.LienHeService;
import com.potteryshop.service.NguoiDungService;
import com.potteryshop.service.VaiTroService;

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
	@Autowired
	private LienHeService lienHeService;
    @Autowired
	private VaiTroService vaiTroService;
    
    @ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser(boolean isBlocked) {

		if (!isBlocked) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();

			return nguoiDungService.findByEmail(auth.getName());
		} else
			return null;
	}
	
	
	@GetMapping(value= {"", "/don-hang"})
	public String employeePage(Model model) {
          System.out.println(loggedInUser(false));
		
		if(loggedInUser(false)!=null && loggedInUser(false).getIsBlocked()) {
			
			return "client/blockedPage";
		}
		else {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();

			NguoiDung user = nguoiDungService.findByEmail(auth.getName());
			user.setListDonHang(donHangService.findByTrangThaiDonHangAndEmployee("Đang giao", user));
			model.addAttribute("employee", user);

			int donHangMoi=donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua");
			
			model.addAttribute("donHangMoi", donHangMoi);
			return "employee/quanLyDonHang";
		}
		
	}
	
	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		NguoiDung user = nguoiDungService.findByEmail(auth.getName());
		user.setListDonHang(donHangService.findByTrangThaiDonHangAndEmployee("Đang giao", user));
		model.addAttribute("employee", user);
		model.addAttribute("user", getSessionUser(request));
		System.out.println(getSessionUser(request).toString());
		int donHangMoi=donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua");
		
		model.addAttribute("donHangMoi", donHangMoi);
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
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		NguoiDung user = nguoiDungService.findByEmail(auth.getName());
		user.setListDonHang(donHangService.findByTrangThaiDonHangAndEmployee("Đang giao", user));
		model.addAttribute("employee", user);
		model.addAttribute("listNhanHieu", hangSXService.getALlHangSX());
model.addAttribute("listDanhMuc", danhMucService.getAllDanhMuc());
int donHangMoi=donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua");

model.addAttribute("donHangMoi", donHangMoi);
		return "employee/quanLySanPham";
	}
	@GetMapping("/danh-muc")
	public String quanLyDanhMucPage(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		NguoiDung user = nguoiDungService.findByEmail(auth.getName());
		user.setListDonHang(donHangService.findByTrangThaiDonHangAndEmployee("Đang giao", user));
		model.addAttribute("employee", user);
		int donHangMoi=donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua");
		
		model.addAttribute("donHangMoi", donHangMoi);
		return "employee/quanLyDanhMuc";
	}
	@GetMapping("/tai-khoan")
	public String quanLyTaiKhoanPage(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		NguoiDung user = nguoiDungService.findByEmail(auth.getName());
		user.setListDonHang(donHangService.findByTrangThaiDonHangAndEmployee("Đang giao", user));
		model.addAttribute("employee", user);
	    model.addAttribute("listVaiTro", vaiTroService.findAllVaiTro());
	    ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ giao"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Hoàn thành"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		int donHangMoi=donHangService.countByTrangThaiDonHang("Đang chờ xác nhận khách mua");
		
		model.addAttribute("donHangMoi", donHangMoi);
		
		if (loggedInUser(false) != null && loggedInUser(false).getIsBlocked()) {

			return "client/blockedPage";
		} else {
			return "employee/quanLyTaiKhoan";
		}
	}
	@GetMapping("employee/export/execl")
	public void exportToPDF(HttpServletResponse response) throws DocumentException, IOException {
		response.setContentType("application/octet-stream");
		
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());
		 String headerKey = "Content-Disposition";
		 String headerValue = "attachment; filename=donhang_" + currentDateTime + ".xlsx";
	        response.setHeader(headerKey, headerValue);
	      List<DonHang> listdonhang = donHangService.fillAll();
	      EmployeePDF exporter = new EmployeePDF(listdonhang);
	       exporter.export(response);
	}


}
