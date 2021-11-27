package com.potteryshop.api.employee;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.potteryshop.dto.CapNhatDonHangEmployee;
import com.potteryshop.dto.SearchDonHangObject;
import com.potteryshop.entities.ChiTietDonHang;
import com.potteryshop.entities.DonHang;
import com.potteryshop.entities.NguoiDung;
import com.potteryshop.service.DonHangService;
import com.potteryshop.service.NguoiDungService;

@RestController
@RequestMapping("/api/employee/don-hang")
public class DonHangEmployeeApi {

	@Autowired
	private DonHangService donHangService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@GetMapping("/all")
	public Page<DonHang> getDonHangByFilter(@RequestParam(defaultValue = "1") int page, @RequestParam String trangThai,
			@RequestParam String tuNgay, @RequestParam String denNgay, @RequestParam long idEmployee)
			throws ParseException {

		SearchDonHangObject object = new SearchDonHangObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiDon(trangThai);
		object.setTuNgay(tuNgay);

		
		
		NguoiDung employee = nguoiDungService.findById(idEmployee);
		System.out.println(employee);
		Page<DonHang> listDonHang = donHangService.findDonHangByEmployee(object, page, 6, employee);
		return listDonHang;
	}

@GetMapping("/listConfirmGuest")
	public Page<DonHang> getDonHangByFilter(@RequestParam(defaultValue = "1") int page,
       @RequestParam String tuNgay, @RequestParam String denNgay) throws ParseException {

		SearchDonHangObject object = new SearchDonHangObject();
		object.setDenNgay(denNgay);
		object.setTrangThaiDon("Đang chờ xác nhận khách mua");
		object.setTuNgay(tuNgay);
		Page<DonHang> listDonHang = donHangService.getAllDonHangByFilter(object, page);
		return listDonHang;
	}    

	@GetMapping("/{id}")
	public DonHang getDonHangById(@PathVariable long id) {
		return donHangService.findById(id);
	}

	@PostMapping("/confirmGuest")
	public void xacNhanKhachMua(@RequestBody CapNhatDonHangEmployee capNhatDonHangEmployee) {
		DonHang donHang = donHangService.findById(capNhatDonHangEmployee.getIdDonHang());

		for (ChiTietDonHang chiTiet : donHang.getDanhSachChiTiet()) {
			for (CapNhatDonHangEmployee.CapNhatChiTietDon chiTietCapNhat : capNhatDonHangEmployee
					.getDanhSachCapNhatChiTietDon()) {
				if (chiTiet.getId() == chiTietCapNhat.getIdChiTiet()) {
					chiTiet.setSoLuongNhanHang(chiTietCapNhat.getSoLuongNhanHang());
				}
			}
		}

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			String dateStr = format.format(new Date());
			Date date = format.parse(dateStr);
			donHang.setNgayNhanHang(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		donHang.setTrangThaiDonHang("Đang chờ giao");

		String ghiChu = capNhatDonHangEmployee.getGhiChuEmployee();

		if (!ghiChu.equals("")) {
			donHang.setGhiChu("Ghi chú employee: \n" + capNhatDonHangEmployee.getGhiChuEmployee());
		}
		donHangService.save(donHang);

	}
	
	@PostMapping("/update")
	public void capNhatTrangThaiDonHang(@RequestBody CapNhatDonHangEmployee capNhatDonHangEmployee) {
		DonHang donHang = donHangService.findById(capNhatDonHangEmployee.getIdDonHang());

		for (ChiTietDonHang chiTiet : donHang.getDanhSachChiTiet()) {
			for (CapNhatDonHangEmployee.CapNhatChiTietDon chiTietCapNhat : capNhatDonHangEmployee
					.getDanhSachCapNhatChiTietDon()) {
				if (chiTiet.getId() == chiTietCapNhat.getIdChiTiet()) {
					chiTiet.setSoLuongNhanHang(chiTietCapNhat.getSoLuongNhanHang());
				}
			}
		}

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {

			String dateStr = format.format(new Date());
			Date date = format.parse(dateStr);
			donHang.setNgayNhanHang(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		donHang.setTrangThaiDonHang("Chờ duyệt");

		String ghiChu = capNhatDonHangEmployee.getGhiChuEmployee();

		if (!ghiChu.equals("")) {
			donHang.setGhiChu("Ghi chú employee: \n" + capNhatDonHangEmployee.getGhiChuEmployee());
		}
		donHangService.save(donHang);

	}
	
	
}
