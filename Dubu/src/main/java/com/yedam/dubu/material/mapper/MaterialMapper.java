package com.yedam.dubu.material.mapper;

import java.util.List;

import com.yedam.dubu.material.service.MaterialVO;

public interface MaterialMapper {
	
	// 자재 목록
	public List<MaterialVO> getMaterialList();
	
}
