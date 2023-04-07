package com.yedam.dubu.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.dubu.sales.service.SalesVO;

public interface SalesMapper {

	// 전체주문서 조회
	public List<SalesVO> searchOrdr(SalesVO vo);

	// 조건별 주문서 조회
	public List<SalesVO> findOrdr(SalesVO vo);

	// 주문서 삭제
	public void deleteOrdr(SalesVO vo);

}
