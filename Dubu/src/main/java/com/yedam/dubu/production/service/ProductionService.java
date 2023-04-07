package com.yedam.dubu.production.service;

import java.util.List;

public interface ProductionService {
	
	// 공정조회
	public List<ProductionVO> selectPrcList();
	
	// 그리드
	public List<ProductionVO> getPrcsGrid(String prcsDiv);
	
	// 삭제
	public int deletePrcsGird(String prcsCd);
	
	// 등록
	public String insertPrcsGrid(ProductionVO productionVO);
	
	// 등록하고자 하는 공정코드
	public String inesrtPrcsCode();
}	
