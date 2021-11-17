package com.potteryshop.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.potteryshop.entities.QSanPham;
import com.potteryshop.dto.SanPhamDto;
import com.potteryshop.dto.SearchSanPhamObject;
import com.potteryshop.entities.SanPham;
import com.potteryshop.repository.DanhMucRepository;
import com.potteryshop.repository.HangSanXuatRepository;
import com.potteryshop.repository.SanPhamRepository;
import com.potteryshop.service.SanPhamService;
import com.querydsl.core.BooleanBuilder;

@Service
public class SanPhamServiceImpl implements SanPhamService {

	@Autowired
	private SanPhamRepository sanPhamRepo;

	@Autowired
	private DanhMucRepository danhMucRepo;

	@Autowired
	private HangSanXuatRepository hangSanXuatRepo;

	// đổi từ SanPhamDto sang đối tượng SanPham để add vào db
	public SanPham convertFromSanPhamDto(SanPhamDto dto) {
		SanPham sanPham = new SanPham();
		if (!dto.getId().equals("")) {
			sanPham.setId(Long.parseLong(dto.getId()));
		}
		sanPham.setTenSanPham(dto.getTenSanPham());
		sanPham.setSoLuong(Integer.parseInt(dto.getSoLuong()));
	
		sanPham.setMauSac(dto.getMauSac());
		sanPham.setKichThuoc(dto.getKichThuoc());
		sanPham.setThietKe(dto.getThietKe());
		sanPham.setChatLieu(dto.getChatLieu());

		
		sanPham.setDanhMuc(danhMucRepo.findById(dto.getDanhMucId()).get());
		sanPham.setHangSanXuat(hangSanXuatRepo.findById(dto.getNhaSXId()).get());
		sanPham.setDonGia(Long.parseLong(dto.getDonGia()));
		sanPham.setThongTinBaoHanh(dto.getThongTinBaoHanh());
		sanPham.setThongTinChung(dto.getThongTinChung());
		

		return sanPham;
	}

	@Override
	public SanPham save(SanPhamDto dto) {
		SanPham sp = convertFromSanPhamDto(dto);
		System.out.println(sp);
		return sanPhamRepo.save(sp);
	}

	@Override
	public SanPham update(SanPhamDto dto) {
		return sanPhamRepo.save(convertFromSanPhamDto(dto));
	}

	@Override
	public void deleteById(long id) {
		sanPhamRepo.deleteById(id);

	}

	@Override
	public Page<SanPham> getAllSanPhamByFilter(SearchSanPhamObject object, int page, int limit) {
		BooleanBuilder builder = new BooleanBuilder();
		String price = object.getDonGia();

		// sắp xếp theo giá
		Sort sort = Sort.by(Direction.ASC, "donGia"); // mặc định tăng dần
		if (object.getSapXepTheoGia().equals("desc")) { // giảm dần
			sort = Sort.by(Direction.DESC, "donGia");
		}

		if (!object.getDanhMucId().equals("") && object.getDanhMucId() != null) {
			builder.and(QSanPham.sanPham.danhMuc.eq(danhMucRepo.findById(Long.parseLong(object.getDanhMucId())).get()));
		}

		if (!object.getHangSXId().equals("") && object.getHangSXId() != null) {
			builder.and(QSanPham.sanPham.hangSanXuat
					.eq(hangSanXuatRepo.findById(Long.parseLong(object.getHangSXId())).get()));
		}

		// tim theo don gia
		switch (price) {
		case "duoi-2-trieu":
			builder.and(QSanPham.sanPham.donGia.lt(2000000));
			break;

		case "2-trieu-den-4-trieu":
			builder.and(QSanPham.sanPham.donGia.between(2000000, 4000000));
			break;

		case "4-trieu-den-6-trieu":
			builder.and(QSanPham.sanPham.donGia.between(4000000, 6000000));
			break;

		case "6-trieu-den-10-trieu":
			builder.and(QSanPham.sanPham.donGia.between(6000000, 10000000));
			break;

		case "tren-10-trieu":
			builder.and(QSanPham.sanPham.donGia.gt(10000000));
			break;

		default:
			break;
		}
		return sanPhamRepo.findAll(builder, PageRequest.of(page, limit, sort));
	}

	@Override
	public List<SanPham> getLatestSanPham() {
		/*
		 * return sanPhamRepo.
		 * findFirst12ByDanhMucTenDanhMucContainingIgnoreCaseOrderByIdDesc("BÌNH HOA - LỌ HOA"
		 * );
		 */
		return	 sanPhamRepo.findAll(PageRequest.of(0,12, Sort.by("id").descending())).getContent();
	}

	public Iterable<SanPham> getSanPhamByTenSanPhamWithoutPaginate(SearchSanPhamObject object) {
		BooleanBuilder builder = new BooleanBuilder();
		int resultPerPage = 12;
		String[] keywords = object.getKeyword();
		String sort = object.getSort();
		String price = object.getDonGia();
		// Keyword
		builder.and(QSanPham.sanPham.tenSanPham.like("%" + keywords[0] + "%"));
		if (keywords.length > 1) {
			for (int i = 1; i < keywords.length; i++) {
				builder.and(QSanPham.sanPham.tenSanPham.like("%" + keywords[i] + "%"));
			}
		}
		// Muc gia
		switch (price) {
		case "duoi-2-trieu":
			builder.and(QSanPham.sanPham.donGia.lt(2000000));
			break;

		case "2-trieu-den-4-trieu":
			builder.and(QSanPham.sanPham.donGia.between(2000000, 4000000));
			break;

		case "4-trieu-den-6-trieu":
			builder.and(QSanPham.sanPham.donGia.between(4000000, 6000000));
			break;

		case "6-trieu-den-10-trieu":
			builder.and(QSanPham.sanPham.donGia.between(6000000, 10000000));
			break;

		case "tren-10-trieu":
			builder.and(QSanPham.sanPham.donGia.gt(10000000));
			break;

		default:
			break;
		}
		return sanPhamRepo.findAll(builder);
	}

	@Override
	public SanPham getSanPhamById(long id) {
		return sanPhamRepo.findById(id).get();
	}

	// Tim kiem san pham theo keyword, sap xep, phan trang, loc theo muc gia, lay 12
	// san pham moi trang
	@Override
	public Page<SanPham> getSanPhamByTenSanPham(SearchSanPhamObject object, int page, int resultPerPage) {
		BooleanBuilder builder = new BooleanBuilder();
//		int resultPerPage = 12;
		String[] keywords = object.getKeyword();
		String sort = object.getSort();
		String price = object.getDonGia();
		String brand = object.getBrand();
		String manufactor = object.getManufactor();
		// Keyword
		builder.and(QSanPham.sanPham.tenSanPham.like("%" + keywords[0] + "%"));
		if (keywords.length > 1) {
			for (int i = 1; i < keywords.length; i++) {
				builder.and(QSanPham.sanPham.tenSanPham.like("%" + keywords[i] + "%"));
			}
		}
		// Muc gia
		switch (price) {
		case "duoi-2-trieu":
			builder.and(QSanPham.sanPham.donGia.lt(2000000));
			break;

		case "2-trieu-den-4-trieu":
			builder.and(QSanPham.sanPham.donGia.between(2000000, 4000000));
			break;

		case "4-trieu-den-6-trieu":
			builder.and(QSanPham.sanPham.donGia.between(4000000, 6000000));
			break;

		case "6-trieu-den-10-trieu":
			builder.and(QSanPham.sanPham.donGia.between(6000000, 10000000));
			break;

		case "tren-10-trieu":
			builder.and(QSanPham.sanPham.donGia.gt(10000000));
			break;

		default:
			break;
		}

		// Danh muc va hang san xuat
		if (brand.length()>1) {
			builder.and(QSanPham.sanPham.danhMuc.tenDanhMuc.eq(brand));
		}
		if (manufactor.length()>1) {
			builder.and(QSanPham.sanPham.hangSanXuat.tenHangSanXuat.eq(manufactor));
		}

		// Sap xep
		if (sort.equals("newest")) {
			return sanPhamRepo.findAll(builder, PageRequest.of(page - 1, resultPerPage, Sort.Direction.DESC, "id"));
		} else if (sort.equals("priceAsc")) {
			return sanPhamRepo.findAll(builder, PageRequest.of(page - 1, resultPerPage, Sort.Direction.ASC, "donGia"));
		} else if (sort.equals("priceDes")) {
			return sanPhamRepo.findAll(builder, PageRequest.of(page - 1, resultPerPage, Sort.Direction.DESC, "donGia"));
		}
		return sanPhamRepo.findAll(builder, PageRequest.of(page - 1, resultPerPage));
	}

	public List<SanPham> getAllSanPhamByList(Set<Long> idList) {
		return sanPhamRepo.findByIdIn(idList);
	}

	@Override
	public Page<SanPham> getSanPhamByTenSanPhamForAdmin(String tenSanPham, int page, int size) {
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(QSanPham.sanPham.tenSanPham.like("%" + tenSanPham + "%"));
		return sanPhamRepo.findAll(builder, PageRequest.of(page, size));
	}
	
	
	@Override
	public Iterable<SanPham> getSanPhamByTenDanhMuc(String brand) {
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(QSanPham.sanPham.danhMuc.tenDanhMuc.eq(brand));
		return sanPhamRepo.findAll(builder);
	}
	
	@Override
	public Page<SanPham> getSanPhamByBrand(SearchSanPhamObject object, int page, int resultPerPage) {
		BooleanBuilder builder = new BooleanBuilder();
		String price = object.getDonGia();
		String brand = object.getBrand();
		String manufactor = object.getManufactor();
		String mausac = object.getMausac();
		String kichthuoc = object.getKichthuoc();
		String thietke = object.getThietke();
		// Muc gia
		switch (price) {
		case "duoi-2-trieu":
			builder.and(QSanPham.sanPham.donGia.lt(2000000));
			break;

		case "2-trieu-den-4-trieu":
			builder.and(QSanPham.sanPham.donGia.between(2000000, 4000000));
			break;

		case "4-trieu-den-6-trieu":
			builder.and(QSanPham.sanPham.donGia.between(4000000, 6000000));
			break;

		case "6-trieu-den-10-trieu":
			builder.and(QSanPham.sanPham.donGia.between(6000000, 10000000));
			break;

		case "tren-10-trieu":
			builder.and(QSanPham.sanPham.donGia.gt(10000000));
			break;

		default:
			break;
		}

		// Danh muc va hang san xuat
		if (brand.length()>1) {
			builder.and(QSanPham.sanPham.danhMuc.tenDanhMuc.eq(brand));
		}
		if (manufactor.length()>1) {
			builder.and(QSanPham.sanPham.hangSanXuat.tenHangSanXuat.eq(manufactor));
		}
		if (mausac.length()>1) {
			builder.and(QSanPham.sanPham.mauSac.like("%"+mausac+"%"));
		}
		if (kichthuoc.length()>1) {
			builder.and(QSanPham.sanPham.kichThuoc.like("%"+kichthuoc+"%"));
		}
		if (thietke.length()>1) {
			builder.and(QSanPham.sanPham.thietKe.eq(thietke));
		}

		return sanPhamRepo.findAll(builder, PageRequest.of(page - 1, resultPerPage));
	}
}
