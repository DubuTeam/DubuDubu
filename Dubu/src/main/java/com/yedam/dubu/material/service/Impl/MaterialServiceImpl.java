package com.yedam.dubu.material.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.material.mapper.MaterialMapper;
import com.yedam.dubu.material.service.MaterialService;
import com.yedam.dubu.material.service.MaterialVO;

@Service
public class MaterialServiceImpl implements MaterialService{
	
	@Autowired
	MaterialMapper materialMapper;

	// 자재 목록
	@Override
	public List<MaterialVO> getMaterialList() {
		return materialMapper.getMaterialList();
	}

	// 자재 발주 리스트
	@Override
	public List<MaterialVO> getMaterialOrderList() {
		return materialMapper.getMaterialOrderList();
	}
	
	// 다음에 오는 발주코드
	@Override
	public MaterialVO getNextMaterialOrderCode() {
		return materialMapper.getNextMaterialOrderCode();
	}

}
