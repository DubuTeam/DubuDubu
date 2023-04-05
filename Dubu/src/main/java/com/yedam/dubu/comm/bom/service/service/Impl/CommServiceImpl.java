package com.yedam.dubu.comm.bom.service.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.comm.bom.mapper.CommMapper;
import com.yedam.dubu.comm.bom.service.CommService;

@Service
public class CommServiceImpl implements CommService {

	@Autowired
	CommMapper commMapper;
	
}
