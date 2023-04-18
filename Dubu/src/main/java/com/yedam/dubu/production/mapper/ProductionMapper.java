package com.yedam.dubu.production.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.dubu.production.service.ProductionVO;

public interface ProductionMapper {

	// 조회
	public List<ProductionVO> selectPrcList();
	
	// 그리드
	public List<ProductionVO> selectPrcsGrid(@Param("prcsDiv")String prcsDiv);
	
	// 삭제
	public int deletePrcsGrid(String prcsCd);
	
	// 등록
	public int insertPrcsGrid(ProductionVO vo);
	
	// 수정
	public int updatePrcsGrid(ProductionVO vo);
	
	// 등록하고자 하는 공정코드
	public String inesrtPrcsCode();
	
	// 주문서 조회
	public List<ProductionVO> selectOrderList(@Param("orderNo")String orderNo);
	//public List<ProductionVO> selectOrderList();
	
	// 주문서 디테일 조회
	public List<ProductionVO> orderDetailGrid(ProductionVO productionVO);
	
	// 생산계획 제품명 추가
	public int insertPlanNm(ProductionVO productionVO);
	
	//샹선걔획 생산량 추가
	public int insertPlanCnt(ProductionVO productionVO);
	
	// 생산계획 등록
	public int insertPlan(ProductionVO productionVO);
	public int updatePlanCode(ProductionVO productionVO);
	
	// 계획코드
	public String planCode();
	
	// 생산계획코드 부여 여부 - 수정
	//public int updatePlanYn(ProductionVO vo);
	
	// 생산계획 제품 조회
	public List<ProductionVO> selectPlanEquip(ProductionVO productionVO);
	// 생산계획 사용가능자재 조회
	public List<ProductionVO> selectPlanMaterial(ProductionVO productionVO);
	// 생산계획 제품공정확인 조회
	public List<ProductionVO> planEquipCheck(String prdtNm);
	// 생산계획 자재확인 조회
	//public List<ProductionVO> planMaterialCheck(@Param("prcLotCd")String prcLotCd);
	
	// 생산지시 계획 조회
	public List<ProductionVO> selectIndicaOrder(@Param("planCd")String planCd);
	// 생산지시 계획 디테일 조회
	public List<ProductionVO> selectIndicaOrderDetail(@Param("planCd")String planCd);
}
