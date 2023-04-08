package com.yedam.dubu.sales.service;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SalesService {

	// 전체주문서 조회
	public List<SalesVO> searchOrdr(SalesVO vo);

	// 조건별 주문서 조회
	public List<SalesVO> findOrdr(SalesVO vo);

	// 주문서 삭제
	public void deleteOrdr(List<SalesVO> delList);

	// 거래처 목록 조회 모달창
	public List<SalesVO> comSearch(SalesVO vo);
}
