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

	// 주문서 수정 추가
	public void saveOrdr(List<SalesVO> ordList);

	///////////////////////////////////////////////////////////////////////
	// saleslst.jsp 페이지

	// 제품 입고 목록 조건별 조회
	public List<SalesIstVO> istOptionList(SalesIstVO vo);

	// 완제품LOT번호 모달 조회
	public List<PrdtInspVO> getLotList(PrdtInspVO vo);

	// 제품 입고 등록&수정 - 제품 입고번호 생성, 등록 시 출력
	public void saveIst(SalesIstVO vo);

	// 제품 입고 목록 현재 날짜 기준으로 조회(첫페이지)
	public List<SalesIstVO> salesIstList(SalesIstVO vo);

	// 제품 입고후 상태 Completed 로 변경
	public void modifyProg(SalesVO vo);

	public SalesVO getlstNo(SalesVO vo);

///////////////////////////////////////////////////////////////////////
// oust.jsp 페이지
	// 진행중 주문서 현황 목록 조회
	public List<SalesVO> findOrder(SalesVO vo);

	// 출고등록 현황조회
	public List<OustVO> getOustList(OustVO vo);

	// 진행주문서 모달조회
	public List<OustVO> getmodalList(OustVO vo);

	// 완제품 재고현황 모달에서 출고량 입력 후 출고등록
	public void saveSalesOust(OustVO vo);

	// 출고현황 조회
	public List<OustVO> findOust(OustVO vo);

	// 출고등록 후 출고완료로 변경
	public void updateProg(SalesVO vo);
	
	public void modifyProg2(SalesVO vo);
}
