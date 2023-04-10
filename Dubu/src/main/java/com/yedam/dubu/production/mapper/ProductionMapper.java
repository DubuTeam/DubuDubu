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
	public List<ProductionVO> OrderList();
}
