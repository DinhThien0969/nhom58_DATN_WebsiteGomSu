package com.potteryshop.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.service.Service;
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

import com.lowagie.text.DocumentException;
import com.potteryshop.dto.ListCongViecDTO;
import com.potteryshop.entities.ChiTietDonHang;
import com.potteryshop.entities.DonHang;
import com.potteryshop.entities.NguoiDung;
import com.potteryshop.entities.VaiTro;
import com.potteryshop.entities.donhangPDFexporter;
import com.potteryshop.repository.DonHangRepository;
import com.potteryshop.service.ChiTietDonHangService;
import com.potteryshop.service.DanhMucService;
import com.potteryshop.service.DonHangService;
import com.potteryshop.service.HangSanXuatService;
import com.potteryshop.service.LienHeService;
import com.potteryshop.service.NguoiDungService;
import com.potteryshop.service.VaiTroService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {

	@Autowired
	private DanhMucService danhMucService;

	@Autowired
	private HangSanXuatService hangSXService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private VaiTroService vaiTroService;
	
	@Autowired
	private LienHeService lienHeService;

	@Autowired
	private DonHangService donHangService;
	@Autowired
	private ChiTietDonHangService chitietdonhangService;
	@Autowired
	private DonHangRepository donHangRepo;

	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

	@GetMapping
	public String adminPage(Model model) {
		ListCongViecDTO listCongViec = new ListCongViecDTO();
		listCongViec.setSoDonHangMoi(donHangService.countByTrangThaiDonHang("Đang chờ giao"));
		listCongViec.setSoDonhangChoDuyet(donHangService.countByTrangThaiDonHang("Chờ duyệt"));
		listCongViec.setSoLienHeMoi(lienHeService.countByTrangThai("Đang chờ trả lời"));
		
		model.addAttribute("listCongViec", listCongViec);
		return "admin/trangAdmin";
	}

	@GetMapping("/danh-muc")
	public String quanLyDanhMucPage() {
		return "admin/quanLyDanhMuc";
	}

	@GetMapping("/nhan-hieu")
	public String quanLyNhanHieuPage() {
		return "admin/quanLyNhanHieu";
	}

	@GetMapping("/lien-he")
	public String quanLyLienHePage() {
		return "admin/quanLyLienHe";
	}
	
	@GetMapping("/san-pham")
	public String quanLySanPhamPage(Model model) {
		model.addAttribute("listNhanHieu", hangSXService.getALlHangSX());
		model.addAttribute("listDanhMuc", danhMucService.getAllDanhMuc());
		return "admin/quanLySanPham";
	}

	@GetMapping("/profile")
	public String profilePage(Model model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
		return "admin/profile";
	}

	@PostMapping("/profile/update")
	public String updateNguoiDung(@ModelAttribute NguoiDung nd, HttpServletRequest request) {
		NguoiDung currentUser = getSessionUser(request);
		currentUser.setDiaChi(nd.getDiaChi());
		currentUser.setHoTen(nd.getHoTen());
		currentUser.setSoDienThoai(nd.getSoDienThoai());
		nguoiDungService.updateUser(currentUser);
		return "redirect:/admin/profile";
	}

	@GetMapping("/don-hang")
	public String quanLyDonHangPage(Model model) {
		Set<VaiTro> vaiTro = new HashSet<>();
		// lấy danh sách employee
		vaiTro.add(vaiTroService.findByTenVaiTro("ROLE_EMPLOYEE"));
		List<NguoiDung> employees = nguoiDungService.getNguoiDungByVaiTro(vaiTro);
		for (NguoiDung employee : employees) {
			employee.setListDonHang(donHangService.findByTrangThaiDonHangAndEmployee("Đang giao", employee));
		}
		model.addAttribute("allEmployee", employees);
		return "admin/quanLyDonHang";
	}

	@GetMapping("/tai-khoan")
	public String quanLyTaiKhoanPage(Model model) {
	    model.addAttribute("listVaiTro", vaiTroService.findAllVaiTro());
		return "admin/quanLyTaiKhoan";
	}
	
	@GetMapping("/thong-ke")
	public String thongKePage(Model model) {
		return "admin/thongKe";
	}
	
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
	@GetMapping("users/export/pdf")
	public void exportToPDF(HttpServletResponse response) throws DocumentException, IOException {
		response.setContentType("application/pdf");
		
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());
		 String headerKey = "Content-Disposition";
		 String headerValue = "attachment; filename=donhang_" + currentDateTime + ".pdf";
	        response.setHeader(headerKey, headerValue);
	      List<DonHang> listdonhang = donHangService.fillAll();
	       donhangPDFexporter exporter = new donhangPDFexporter(listdonhang);
	       exporter.export(response);
	}

}
