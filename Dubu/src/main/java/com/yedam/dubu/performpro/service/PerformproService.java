package com.yedam.dubu.performpro.service;

import java.util.List;

public interface PerformproService {
	
	// 생산지시 헤더 리스트
	public List<PerformproVO> indicaHeader();

	// 생산지시 디테일 리스트(생상할 제품 리스트)
	public List<PerformproVO> getProdList(String indicaCd);
	
	// 한 제품의 생산 공정 흐름
	public List<PerformproVO> getProcessFlow(String prodOrderDetailCd);
	
	// 한 공정에 들어가는 설비
	public List<PerformproVO> getEqm(String prcsCd);
	
	// 해당 공정에 필요한 자재
	public List<PerformproVO> getRsc(PerformproVO performproVO);
	
}	
