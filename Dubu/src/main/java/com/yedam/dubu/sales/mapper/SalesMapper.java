package com.yedam.dubu.sales.mapper;

import java.util.List;

import com.yedam.dubu.sales.service.SalesIstVO;
import com.yedam.dubu.sales.service.SalesVO;
import com.yedam.dubu.sales.service.VendVO;

public interface SalesMapper {

	// 전체주문서 조회
	public List<SalesVO> searchOrdr(SalesVO vo);

	// 조건별 주문서 조회
	public List<SalesVO> findOrdr(SalesVO vo);

	// 주문서 삭제
	public void deleteOrdr(SalesVO vo);

	// 거래처 목록 조회 모달창
	public List<VendVO> comSearch(VendVO vo);

	// 제품명 목록 조회 모달창
	public List<SalesVO> proSearch(SalesVO vo);

	// 주문번호 생성, 가져오기
	public SalesVO getordrNo(SalesVO vo);

	//주문서 수정입력
	public void saveOrdr(SalesVO ordList);
	
	///////////////////////////////////////////////////////////////////////
	//saleslst.jsp 페이지 
	//제품 입고 목록 현재 날짜 기준으로 조회(첫페이지)
	public List<SalesIstVO> salesIstList(SalesIstVO vo);
}
