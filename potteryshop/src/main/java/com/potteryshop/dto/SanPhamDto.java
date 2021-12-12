package com.potteryshop.dto;


import org.springframework.web.multipart.MultipartFile;

public class SanPhamDto {

	private String id;

	private String tenSanPham;
	private String soLuong;
	private String thietKe;
	private String thongTinChung;
	private String donGia;
	private String chatLieu;
	private String mauSac;
	private String kichThuoc;
	
	private String thongTinBaoHanh;
	
	
	private long danhMucId;
	private long nhaSXId;
	
	private MultipartFile hinhAnh;

	public MultipartFile getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(MultipartFile hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}

	public String getChatLieu() {
		return chatLieu;
	}

	public void setChatLieu(String chatLieu) {
		this.chatLieu = chatLieu;
	}

	public String getMauSac() {
		return mauSac;
	}

	public void setMauSac(String mauSac) {
		this.mauSac = mauSac;
	}

	public String getKichThuoc() {
		return kichThuoc;
	}

	public void setKichThuoc(String kichThuoc) {
		this.kichThuoc = kichThuoc;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public String getDonGia() {
		return donGia;
	}

	public void setDonGia(String donGia) {
		this.donGia = donGia;
	}

	public String getThongTinBaoHanh() {
		return thongTinBaoHanh;
	}

	public void setThongTinBaoHanh(String thongTinBaoHanh) {
		this.thongTinBaoHanh = thongTinBaoHanh;
	}

	public String getThongTinChung() {
		return thongTinChung;
	}

	public void setThongTinChung(String thongTinChung) {
		this.thongTinChung = thongTinChung;
	}

	public String getThietKe() {
		return thietKe;
	}

	public void setThietKe(String thietKe) {
		this.thietKe = thietKe;
	}


	public long getDanhMucId() {
		return danhMucId;
	}

	public void setDanhMucId(long danhMucId) {
		this.danhMucId = danhMucId;
	}

	public long getNhaSXId() {
		return nhaSXId;
	}

	public void setNhaSXId(long nhaSXId) {
		this.nhaSXId = nhaSXId;
	}
	


	@Override
	public String toString() {
		return "SanPhamDto [id=" + id + ", tenSanPham=" + tenSanPham + ", donGia=" + donGia + ", soLuong=" + soLuong
				+ ", thongTinBaoHanh=" + thongTinBaoHanh + ", thongTinChung=" + thongTinChung + ", mauSac=" + mauSac
				+ ", kichThuoc=" + kichThuoc + ", chatLieu=" + chatLieu +  ", thietKe=" + thietKe
				+ ", danhMucId=" + danhMucId + ", nhaSXId=" + nhaSXId + ", hinhAnh="
				+ hinhAnh + "]";
	}
}
