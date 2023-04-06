package com.yedam.dubu.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.dubu.sales.service.SalesVO;

public interface SalesMapper {

	
	public List<SalesVO> searchSalesList(String vendNm, String prdtNm, String orderDt);
}

