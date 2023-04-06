package com.yedam.dubu.sales.service;

import java.time.LocalDate;
import java.util.List;



public interface SalesService {

	// 검색
	public List<SalesVO> getOrderList(String vendNm, String prdtNm, LocalDate startDate, LocalDate endDate);



	
}
