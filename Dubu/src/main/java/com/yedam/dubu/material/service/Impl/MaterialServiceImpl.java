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

	@Override
	public List<MaterialVO> getMaterialList() {
		return materialMapper.getMaterialList();
	}

}
