package com.yedam.dubu.sales.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.sales.mapper.SalesMapper;
import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;


@Service
public class SalesServiceImpl implements SalesService {

	@Autowired SalesMapper salesMapper;



	@Override
	public List<SalesVO> searchSalesList(String vendNm) {
		return salesMapper.searchSalesList(vendNm);
	}



	@Override
	public int deleteSalesInfo(String orderNo) {
		// TODO Auto-generated method stub
		return salesMapper.deleteSalesInfo(orderNo);
	}







  
}



