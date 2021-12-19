package com.potteryshop.entities;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class EmployeePDF {
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private List<DonHang> donhang;

	public EmployeePDF(List<DonHang> donhang) {
		super();
		this.donhang = donhang;
		workbook = new XSSFWorkbook();
		sheet = workbook.createSheet("ThongKeDonHang");

	}

	private void writeHeaderRow() {
		XSSFFont font = workbook.createFont();
		CellStyle style = workbook.createCellStyle();
		font.setFontHeight(14);
		style.setFont(font);
		font.setBold(true);
		org.apache.poi.ss.usermodel.Row row = sheet.createRow(0);

		Cell cell = row.createCell(0);
		cell.setCellValue("DonHang ID");
		cell.setCellStyle(style);

		cell = row.createCell(1);
		cell.setCellValue("Nguoi_nhan");
		cell.setCellStyle(style);

		cell = row.createCell(2);
		cell.setCellValue("Dia_Chi_Nhan");
		cell.setCellStyle(style);

		cell = row.createCell(3);
		cell.setCellValue("Ngay_Dat_Hang");
		cell.setCellStyle(style);

		cell = row.createCell(4);
		cell.setCellValue("Ngay_Giao_Hang");
		cell.setCellStyle(style);

		cell = row.createCell(5);
		cell.setCellValue("Ngay_Nhan_Hang");
		cell.setCellStyle(style);

		cell = row.createCell(6);
		cell.setCellValue("Trang_Thai_Don_Hang");
		cell.setCellStyle(style);

		cell = row.createCell(7);
		cell.setCellValue("SĐT_Nhan_Hang");
		cell.setCellStyle(style);

		cell = row.createCell(8);
		cell.setCellValue("Ho_Ten_Nguoi_Dat");
		cell.setCellStyle(style);

		cell = row.createCell(9);
		cell.setCellValue("Dia_Chi_Nguoi_Dat");
		cell.setCellStyle(style);

		cell = row.createCell(10);
		cell.setCellValue("So_Dien_Thoai_Nguoi_Dat");
		cell.setCellStyle(style);

		cell = row.createCell(11);
		cell.setCellValue("Tong_gia_Tri");
		cell.setCellStyle(style);

	}

	private void writeDataRow() {
		int rowCount = 1;

		for (DonHang chitietdonhang : donhang) {

			org.apache.poi.ss.usermodel.Row row = sheet.createRow(rowCount++);

			Cell cell = row.createCell(0);
			cell.setCellValue(chitietdonhang.getId());
			sheet.autoSizeColumn(0);

			cell = row.createCell(1);
			cell.setCellValue(chitietdonhang.getHoTenNguoiNhan());
			sheet.autoSizeColumn(1);

			cell = row.createCell(2);
			cell.setCellValue(chitietdonhang.getDiaChiNhan());
			sheet.autoSizeColumn(2);
			cell = row.createCell(3);
			cell.setCellValue(chitietdonhang.getNgayDatHang().toString());
			sheet.autoSizeColumn(3);

			if (chitietdonhang.getNgayGiaoHang() == null) {
				cell = row.createCell(4);
				cell.setCellValue(" ");
				sheet.autoSizeColumn(4);
			} else {
				cell = row.createCell(4);
				cell.setCellValue(chitietdonhang.getNgayGiaoHang().toString());
				sheet.autoSizeColumn(4);
			}
			if (chitietdonhang.getNgayNhanHang() == null) {
				cell = row.createCell(5);
				cell.setCellValue("");
				sheet.autoSizeColumn(5);
			} else {
				cell = row.createCell(5);
				cell.setCellValue(chitietdonhang.getNgayNhanHang().toString());
				sheet.autoSizeColumn(5);
			}
			cell = row.createCell(6);
			cell.setCellValue(chitietdonhang.getTrangThaiDonHang());
			sheet.autoSizeColumn(6);

			cell = row.createCell(7);
			cell.setCellValue(chitietdonhang.getSdtNhanHang());
			sheet.autoSizeColumn(7);

			cell = row.createCell(8);
			cell.setCellValue(chitietdonhang.getNguoiDat().getHoTen());
			sheet.autoSizeColumn(8);

			cell = row.createCell(9);
			cell.setCellValue(chitietdonhang.getNguoiDat().getDiaChi());
			sheet.autoSizeColumn(9);

			cell = row.createCell(10);
			cell.setCellValue(chitietdonhang.getNguoiDat().getSoDienThoai());
			sheet.autoSizeColumn(10);

			cell = row.createCell(11);
			cell.setCellValue(chitietdonhang.getTongGiaTri());
			sheet.autoSizeColumn(11);

		}

	}

	public void export(HttpServletResponse response) throws IOException {
		writeDataRow();
		writeHeaderRow();

		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		workbook.close();
		outputStream.close();

	}
}

