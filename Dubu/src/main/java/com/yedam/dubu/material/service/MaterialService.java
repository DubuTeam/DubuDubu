package com.yedam.dubu.material.service;

import java.util.List;

public interface MaterialService {
	
	// 자재 검색 모달
	public List<MaterialVO> getMaterialModal();
		
	// 업체 검색 모달
	public List<MaterialVO> getVendModal();
	
	// 자재 목록
	public List<MaterialVO> getMaterialList(MaterialVO materivalVO);
	
	// 자재 발주 리스트
	public List<MaterialVO> getMaterialOrderList();
	
	// 다음에 오는 발주코드
	public MaterialVO getNextMaterialOrderCode();
	
	// 자재발주 INSERT
	public int getMaterialOrderInsert(MaterialVO material);
	
	// 자재발주디테일 INSERT
	public int getMaterialOrderDetailInsert(MaterialVO material);
}
