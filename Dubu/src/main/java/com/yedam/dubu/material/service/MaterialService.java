package com.yedam.dubu.material.service;

import java.util.List;

public interface MaterialService {

	// 자재 목록
	public List<MaterialVO> getMaterialList();
	
	// 자재 발주 리스트
	public List<MaterialVO> getMaterialOrderList();
	
	// 다음에 오는 발주코드
	public MaterialVO getNextMaterialOrderCode();
}
