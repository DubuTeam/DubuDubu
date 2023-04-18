package com.yedam.dubu.performpro.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.performpro.mapper.PerformproMapper;
import com.yedam.dubu.performpro.service.PerformproService;
import com.yedam.dubu.performpro.service.PerformproVO;

@Service
public class PerformproServiceImpl implements PerformproService {

	@Autowired
	PerformproMapper performproMapper;

	// 생산지시 헤더 리스트
	@Override
	public List<PerformproVO> indicaHeader() {
		return performproMapper.indicaHeader();
	}

	// 생산지시 디테일 리스트(생상할 제품 리스트)
	@Override
	public List<PerformproVO> getProdList(String indicaCd) {
		return performproMapper.getProdList(indicaCd);
	}

	// 한 제품의 생산 공정 흐름
	@Override
	public List<PerformproVO> getProcessFlow(String prodOrderDetailCd) {
		return performproMapper.getProcessFlow(prodOrderDetailCd);
	}

	@Override
	public List<PerformproVO> getEqm(String prcsCd) {
		return performproMapper.getEqm(prcsCd);
	}

	@Override
	public List<PerformproVO> getRsc(PerformproVO performproVO) {
		return performproMapper.getRsc(performproVO);
	}
	

}
	 





