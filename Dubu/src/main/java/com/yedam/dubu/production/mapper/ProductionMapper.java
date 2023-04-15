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
	public List<ProductionVO> orderDetailGrid(String[] array);
	
	// 생산계획 코드 부여 PLAN
	public int updatePlanCd(ProductionVO vo);
	
	// 생산계획 코드 부여 PLAN_DTL
	public int updatePlanDtl(ProductionVO vo);
	
	// 생산계획 코드 부여 INDICA
	public int updateIndicac(ProductionVO vo);
	
	// 생산계획 작업 우선 순위 EQ_BOM
	public int updateEqBom(ProductionVO vo);
	
	// 계획코드
	public String planCode();
	
	// 생산계획코드 부여 여부 - 수정
	//public int updatePlanYn(ProductionVO vo);
	
	// 생산계획 제품 조회
	public List<ProductionVO> selectPlanEquip(String[] array);
	// 생산계획 사용가능자재 조회
	public List<ProductionVO> selectPlanMaterial(String[] array);
	// 생산계획 제품공정확인 조회
	public List<ProductionVO> planEquipCheck(@Param("planCd")String planCd);
	// 생산계획 자재확인 조회
	//public List<ProductionVO> planMaterialCheck(@Param("prcLotCd")String prcLotCd);
}
