package com.potteryshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.potteryshop.entities.VaiTro;

public interface VaiTroRepository extends JpaRepository<VaiTro, Long> {

	VaiTro findByTenVaiTro(String tenVaiTro);
	
	@Transactional
	@Modifying
	@Query(value = "update nguoidung_vaitro u set u.ma_vai_tro = 1 where u.ma_nguoi_dung = ?", 
	  nativeQuery = true)
	void updateRoleToAdminByEmployeeId(long id);
}
