package com.yedam.dubu.sales.service;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface SalesService {


	public List<SalesVO> searchSalesList(String vendNm, String prdtNm, String orderDt);


	
}
