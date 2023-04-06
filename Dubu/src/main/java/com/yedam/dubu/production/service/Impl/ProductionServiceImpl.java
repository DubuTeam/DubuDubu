package com.yedam.dubu.production.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.dubu.production.mapper.ProductionMapper;
import com.yedam.dubu.production.service.ProductionService;
import com.yedam.dubu.production.service.ProductionVO;

@Service
public class ProductionServiceImpl implements ProductionService {

	
	@Autowired
	ProductionMapper productionMapper;

	@Override
	public List<ProductionVO> selectPrcList() {
		return productionMapper.selectPrcList();
	}

	@Override
	public List<ProductionVO> getPrcsGrid(String prcsDiv) {
		return productionMapper.selectPrcsGrid(prcsDiv);
	}

	@Override
	public String deletePrcsGird(String prcsDiv) {
		return productionMapper.deletePrcsGrid(prcsDiv);
	}
}
