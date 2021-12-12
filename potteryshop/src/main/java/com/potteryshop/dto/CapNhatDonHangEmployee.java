package com.potteryshop.dto;

import java.util.List;

public class CapNhatDonHangEmployee {
	
	private long idDonHang;
	private String ghiChuEmployee;
	private List<CapNhatChiTietDon> danhSachCapNhatChiTietDon;


	public static class CapNhatChiTietDon {
		private long idChiTiet;
		private int soLuongNhanHang;

		public long getIdChiTiet() {
			return idChiTiet;
		}

		public void setIdChiTiet(long idChiTiet) {
			this.idChiTiet = idChiTiet;
		}

		public int getSoLuongNhanHang() {
			return soLuongNhanHang;
		}

		public void setSoLuongNhanHang(int soLuongNhanHang) {
			this.soLuongNhanHang = soLuongNhanHang;
		}
	}

	public String getGhiChuEmployee() {
		return ghiChuEmployee;
	}

	public void setGhiChuEmployee(String ghiChuEmployee) {
		this.ghiChuEmployee = ghiChuEmployee;
	}

	public List<CapNhatChiTietDon> getDanhSachCapNhatChiTietDon() {
		return danhSachCapNhatChiTietDon;
	}

	public void setDanhSachCapNhatChiTietDon(List<CapNhatChiTietDon> danhSachCapNhatChiTietDon) {
		this.danhSachCapNhatChiTietDon = danhSachCapNhatChiTietDon;
	}

	public long getIdDonHang() {
		return idDonHang;
	}

	public void setIdDonHang(long idDonHang) {
		this.idDonHang = idDonHang;
	}


}
