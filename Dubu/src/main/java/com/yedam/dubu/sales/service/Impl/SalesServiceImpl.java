package com.yedam.dubu.sales.service.Impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.sales.mapper.SalesMapper;
import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;


@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	SalesMapper salesMapper;



	@Override
	public List<SalesVO> getOrderList(String vendNm, String prdtNm, LocalDate startDate, LocalDate endDate) {
		// TODO Auto-generated method stub
		return salesMapper.getOrderList(vendNm,prdtNm,startDate,endDate);
	}


}
