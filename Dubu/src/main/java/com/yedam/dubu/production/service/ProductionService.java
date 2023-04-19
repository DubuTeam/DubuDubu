package com.yedam.dubu.production.service;

import java.util.List;

public interface ProductionService {
	
	// 공정조회
	public List<ProductionVO> selectPrcList();
	
	// 그리드
	public List<ProductionVO> getPrcsGrid(String prcsDiv);
	
	// 삭제
	public int deletePrcsGird(String prcsCd);
	
	// 등록
	public int insertPrcsGrid(List<ProductionVO> list);
	
	// 수정
	public int updatePrcsGrid(List<ProductionVO> update);
	
	// 등록하고자 하는 공정코드
	public String inesrtPrcsCode();
	
	// 주문서 조회
	public List<ProductionVO> selectOrderList(String orderNo);
	//public List<ProductionVO> selectOrderList();
	
	// 주문서 디테일 조회
	public List<ProductionVO> orderDetailGrid(String orderNo);
	
	// 생산계획 등록
	public int insertPlan(List<ProductionVO> name, List<ProductionVO> cnt);
	
	
	// 생산계획 코드 부여
	public int updatePlan (List<ProductionVO> insertPlan);
	
	// 생산계획 제품 조회
	public List<ProductionVO> selectPlanEquip(String orderNo);
	
	// 생산계획 사용가능자재 조회
	public List<ProductionVO> selectPlanMaterial(String orderNo);
	
	// 제품공정확인 조회
	public List<ProductionVO> planEquipCheck(String prdtNm);
	// 제품자재확인 조회
	//public List<ProductionVO> planMaterialCheck(String prcLotCd);
	
	// 생산지시 계획 조회
	public List<ProductionVO> selectIndicaOrder(String planCd);
	
	// 생산지시 계획 디테일 조회
	public List<ProductionVO> selectIndicaOrderDetail(String planCd);
}	
