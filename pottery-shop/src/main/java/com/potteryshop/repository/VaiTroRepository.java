package com.potteryshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.potteryshop.entities.VaiTro;

public interface VaiTroRepository extends JpaRepository<VaiTro, Long> {

	VaiTro findByTenVaiTro(String tenVaiTro);
}
