package com.yedam.dubu.sales.mapper;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.dubu.sales.service.SalesVO;

public interface SalesMapper {
		
	// 검색
	public List<SalesVO> getOrderList(@Param("vendNm")String vendNm, @Param("prdtNm")String prdtNm, @Param("startDate")LocalDate startDate, @Param("endDate")LocalDate endDate);
}
