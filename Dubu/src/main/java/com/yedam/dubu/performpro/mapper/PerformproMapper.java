package com.yedam.dubu.performpro.mapper;

import java.util.List;

import com.yedam.dubu.performpro.service.PerformproVO;

public interface PerformproMapper {

	// 생산지시 헤더 리스트
	public List<PerformproVO> indicaHeader();
	
	// 생산지시 디테일 리스트(생상할 제품 리스트)
	public List<PerformproVO> getProdList(String indicaCd);
	
	// 한 제품의 생산 공정 흐름
	public List<PerformproVO> getProcessFlow(String prodOrderDetailCd);
	
}
