package com.potteryshop.entities;

import java.awt.Color;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.potteryshop.api.admin.DonHangApi;

public class donhangPDFexporter {

	private static List<DonHang> donhang;

	public donhangPDFexporter(List<DonHang> donhang) {
	super();
		this.donhang = donhang;
	}


	private static void writeTableHeader(PdfPTable table) {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.ORANGE);
		cell.setPadding(5);

		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(Color.red);
		cell.setPhrase(new Phrase("ID", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Nguoi_nhan", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Dia_Chi_Nhan", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Ngay_Dat_Hang", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Ngay_Giao_Hang", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Ngay_Nhan_Hang", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Trang_Thai_Don_Hang", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("SĐT_Nhan_Hang", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Ma_Nguoi_Dat", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Tong_gia_Tri", font));
		table.addCell(cell);
	}

	private static void writeTableData(PdfPTable table) {

		
		for(DonHang chitietdonhang : donhang) {
			table.addCell(String.valueOf(chitietdonhang.getId()));
			table.addCell(chitietdonhang.getHoTenNguoiNhan());	
			table.addCell(String.valueOf(chitietdonhang.getDiaChiNhan()));
			table.addCell(String.valueOf(chitietdonhang.getNgayDatHang()));
			table.addCell(String.valueOf(chitietdonhang.getNgayGiaoHang()));
			table.addCell(String.valueOf(chitietdonhang.getNgayNhanHang()));
			table.addCell(String.valueOf(chitietdonhang.getTrangThaiDonHang()));
			table.addCell(chitietdonhang.getSdtNhanHang());
			table.addCell(String.valueOf(chitietdonhang.getNguoiDat().getHoTen()));
			table.addCell(String.valueOf(chitietdonhang.getTongGiaTri()));
			
		
			
			
			
		}
	}

	public static void export(HttpServletResponse response) throws DocumentException, IOException {
		Document document = new Document(PageSize.A3);
		PdfWriter.getInstance(document, response.getOutputStream());
		document.open();

		document.add(new Paragraph("List Chi Tiet Don Hang"));

		PdfPTable table = new PdfPTable(10);
		table.setWidthPercentage(100);
		table.setSpacingBefore(15);
	         

		writeTableHeader(table);
		writeTableData(table);
		document.add(table);
		document.close();
	}
}
