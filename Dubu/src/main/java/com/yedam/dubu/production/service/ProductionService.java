package com.yedam.dubu.production.service;

import java.util.List;

public interface ProductionService {
	
	// 공정조회
	public List<ProductionVO> selectPrcList();
	
	// 그리드
	public List<ProductionVO> getPrcsGrid(String prcsDiv);
	
	// 삭제
	public String deletePrcsGird(String prcsDiv);
}	
