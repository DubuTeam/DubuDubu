package com.yedam.dubu.material.mapper;

import java.util.List;

import com.yedam.dubu.material.service.MaterialVO;

public interface MaterialMapper {
	
	// 자재 목록
	public List<MaterialVO> getMaterialList();
	
	// 자재 발주 리스트
	public List<MaterialVO> getMaterialOrderList();
	
	// 다음에 오는 발주코드
	public MaterialVO getNextMaterialOrderCode();
	
	// 자재발주 INSERT
	public List<MaterialVO> getMaterialOrderInsert();
}
