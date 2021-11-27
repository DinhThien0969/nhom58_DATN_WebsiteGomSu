package com.potteryshop;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
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
public class PaypalController {

	@Autowired
	PaypalService service;

	// cart autowire
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
	//

	public static final String SUCCESS_URL = "pay/success";
	public static final String CANCEL_URL = "pay/cancel";

	@RequestMapping("/paypal")
	public String home(HttpServletRequest res, Model model) {
		NguoiDung currentUser = getSessionUser(res);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Map<Long, String> quanity = new HashMap<Long, String>();
		List<SanPham> listspNew = new ArrayList<SanPham>();
		List<SanPham> listspOld = new ArrayList<SanPham>();
		System.out.println(currentUser);

		if (auth == null || auth.getPrincipal() == "anonymousUser") // Lay tu cookie
		{
			Cookie cl[] = res.getCookies();
			Set<Long> idList = new HashSet<Long>();
			for (int i = 0; i < cl.length; i++) {
				if (cl[i].getName().matches("[0-9]+")) {
					idList.add(Long.parseLong(cl[i].getName()));
					quanity.put(Long.parseLong(cl[i].getName()), cl[i].getValue());
				}

			}
			listspOld = sanPhamService.getAllSanPhamByList(idList);

		} else // Lay tu database
		{
			GioHang g = gioHangService.getGioHangByNguoiDung(currentUser);
			if (g != null) {
				List<ChiMucGioHang> listchimuc = chiMucGioHangService.getChiMucGioHangByGioHang(g);

				Cookie cl[] = res.getCookies();
				Set<Long> idList = new HashSet<Long>();
				for (int i = 0; i < cl.length; i++) {
					if (cl[i].getName().matches("[0-9]+")) {
						idList.add(Long.parseLong(cl[i].getName()));
						quanity.put(Long.parseLong(cl[i].getName()), cl[i].getValue());
					}
				}
				listspNew = sanPhamService.getAllSanPhamByList(idList);

				for (ChiMucGioHang c : listchimuc) {
					listspOld.add(c.getSanPham());
					quanity.put(c.getSanPham().getId(), Integer.toString(c.getSo_luong()));
				}
			}
		}
		System.out.println(listspOld.get(0).getTenSanPham());
		System.out.println(quanity.get(listspOld.get(0).getId()));
		long total = 0;

		for (int i = 0; i < listspOld.size(); i++) {
			long donGia = listspOld.get(i).getDonGia();
			long soLuong = Long.parseLong(quanity.get(listspOld.get(i).getId()));
			System.out.println(donGia + " " + soLuong);
			total += donGia * soLuong;
			System.out.println(total);
		}
		model.addAttribute("giohang", listspOld);
		model.addAttribute("quantity", quanity);
		model.addAttribute("price", total);

		return "client/paypal";
	}

	@PostMapping("pay")
	public String payment(@ModelAttribute("order") Order order) {
		try {
			Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8080/potteryshop/" + CANCEL_URL,
					"http://localhost:8080/potteryshop/" + SUCCESS_URL);
			for (Links link : payment.getLinks()) {
				if (link.getRel().equals("approval_url")) {
					return "redirect:" + link.getHref();
				}
			}

		} catch (PayPalRESTException e) {

			e.printStackTrace();
		}
		return "redirect:/thankyou";
	}

	@GetMapping(value = CANCEL_URL)
	public String cancelPay() {
		return "client/cancel";
	}

	@GetMapping(value = SUCCESS_URL)
	public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
		try {
			Payment payment = service.executePayment(paymentId, payerId);
			System.out.println(payment.toJSON());
			if (payment.getState().equals("approved")) {
				return "redirect:/thankyou";
			}
		} catch (PayPalRESTException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/thankyou";
	}

}