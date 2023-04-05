package com.yedam.dubu.material.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.material.mapper.MaterialMapper;
import com.yedam.dubu.material.service.MaterialService;

@Service
public class MaterialServiceImpl implements MaterialService{
	
	@Autowired
	MaterialMapper materialMapper;

}
