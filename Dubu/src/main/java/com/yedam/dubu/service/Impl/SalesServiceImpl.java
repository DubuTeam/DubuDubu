package com.yedam.dubu.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.sales.mapper.SalesMapper;
import com.yedam.dubu.sales.service.SalesService;


@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	SalesMapper salesMapper;
}
