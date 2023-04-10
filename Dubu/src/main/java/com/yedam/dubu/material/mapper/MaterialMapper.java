package com.yedam.dubu.material.mapper;

import java.util.List;

import com.yedam.dubu.material.service.MaterialVO;

public interface MaterialMapper {
	
	/* 자재 발주 관리 페이지 */
	// 자재 검색 모달
	public List<MaterialVO> getMaterialModal();
	
	// 업체 검색 모달
	public List<MaterialVO> getVendModal();
	
	// 자재 목록
	public List<MaterialVO> getMaterialList(MaterialVO materialVO);
	
	// 다음에 오는 발주코드
	public MaterialVO getNextMaterialOrderCode();
	
	// 자재발주 INSERT
	public int getMaterialOrderInsert(MaterialVO material);
	
	// 자재발주디테일 INSERT
	public int getMaterialOrderDetailInsert(MaterialVO material);
	
	/* 자재 발주 조회 페이지 */
	// 자재 발주 조회
	public List<MaterialVO> getMaterialOrderList(MaterialVO materialVO);
	
	// 자재 발주 상세 리스트
	public List<MaterialVO> getMaterialOrderListDetail(String ordrCd);
}
