package com.yedam.dubu.production.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.dubu.production.service.ProductionVO;

public interface ProductionMapper {

	// 조회
	public List<ProductionVO> selectPrcList();
	
	// 그리드
	public List<ProductionVO> selectPrcsGrid(@Param("prcsDiv")String prcsDiv);
}
