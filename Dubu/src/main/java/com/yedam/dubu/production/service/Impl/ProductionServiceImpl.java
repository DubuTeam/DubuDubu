package com.yedam.dubu.production.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.production.mapper.ProductionMapper;
import com.yedam.dubu.production.service.ProductionService;

@Service
public class ProductionServiceImpl implements ProductionService {

	
	@Autowired
	ProductionMapper productionMapper;
}
