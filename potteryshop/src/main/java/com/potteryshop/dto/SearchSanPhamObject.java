package com.potteryshop.dto;

public class SearchSanPhamObject {
	private String danhMucId;
	private String hangSXId;
	private String donGia;
	
	// sap xep theo gia
	private String sapXepTheoGia;
	private String[] keyword;
	private String sort;
	
	// sap xep theo danhmuc va hangsx
	private String brand;
	private String manufactor;
	
	// theo thietke, mausac, kichthuoc
	private String thietke;
	private String mausac;
	private String kichthuoc;
	
	public SearchSanPhamObject() {
		danhMucId = "";
		hangSXId = "";
		donGia = "";
		sapXepTheoGia = "ASC";
	}

	public String getThietke() {
		return thietke;
	}

	public void setThietke(String thietke) {
		this.thietke = thietke;
	}

	public String getMausac() {
		return mausac;
	}

	public void setMausac(String mausac) {
		this.mausac = mausac;
	}

	public String getKichthuoc() {
		return kichthuoc;
	}

	public void setKichthuoc(String kichthuoc) {
		this.kichthuoc = kichthuoc;
	}

	public String getDanhMucId() {
		return danhMucId;
	}

	public void setDanhMucId(String danhMucId) {
		this.danhMucId = danhMucId;
	}

	public String getHangSXId() {
		return hangSXId;
	}

	public void setHangSXId(String hangSXId) {
		this.hangSXId = hangSXId;
	}

	public String getDonGia() {
		return donGia;
	}

	public void setDonGia(String donGia) {
		this.donGia = donGia;
	}

	public String[] getKeyword() {
		return keyword;
	}

	public void setKeyword(String[] keyword) {
		this.keyword = keyword;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSapXepTheoGia() {
		return sapXepTheoGia;
	}

	public void setSapXepTheoGia(String sapXepTheoGia) {
		this.sapXepTheoGia = sapXepTheoGia;
	}
	
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public String getManufactor() {
		return manufactor;
	}

	public void setManufactor(String manufactor) {
		this.manufactor = manufactor;
	}

	@Override
	public String toString() {
		return "SearchObject [danhMucId=" + danhMucId + ", hangSXId=" + hangSXId + ", price=" + donGia + "]";
	}
}
