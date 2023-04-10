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
	public int insertPrcsGrid(List<ProductionVO> list);
	
	// 수정
	public int updatePrcsGrid(List<ProductionVO> update);
	
	// 등록하고자 하는 공정코드
	public String inesrtPrcsCode();
	
	// 주무서 조회
	public List<ProductionVO> selectOrderList();
}	
