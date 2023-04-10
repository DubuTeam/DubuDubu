package com.yedam.dubu.sales.service;

import java.util.List;

public interface SalesService {

	// 전체주문서 조회
	public List<SalesVO> searchOrdr(SalesVO vo);

	// 조건별 주문서 조회
	public List<SalesVO> findOrdr(SalesVO vo);

	// 주문서 삭제
	public void deleteOrdr(List<SalesVO> delList);

	// 거래처 목록 조회 모달창
	public List<VendVO> comSearch(VendVO vo);

	// 제품명 목록 조회 모달창
	public List<SalesVO> proSearch(SalesVO vo);

	// 주문번호 생성, 가져오기
	public SalesVO getordrNo(SalesVO vo);
}
