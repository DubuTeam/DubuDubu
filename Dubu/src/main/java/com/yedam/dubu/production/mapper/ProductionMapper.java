package com.yedam.dubu.production.mapper;

import java.util.List;

import com.yedam.dubu.production.service.ProductionVO;

public interface ProductionMapper {

	// 조회
	public List<ProductionVO> selectPrcList();
}
