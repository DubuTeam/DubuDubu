package com.yedam.dubu.sales.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.sales.mapper.SalesMapper;
import com.yedam.dubu.sales.service.SalesIstVO;
import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;
import com.yedam.dubu.sales.service.VendVO;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	SalesMapper salesMapper;

	@Override
	public List<SalesVO> searchOrdr(SalesVO vo) {
		// TODO Auto-generated method stub
		return salesMapper.searchOrdr(vo);
	}

	// 조건별 주문서 조회
	@Override
	public List<SalesVO> findOrdr(SalesVO vo) {
		// TODO Auto-generated method stub
		return salesMapper.findOrdr(vo);
	}

	// 주문서 삭제
	@Override
	public void deleteOrdr(List<SalesVO> delList) {
		for (SalesVO vo : delList) {
			salesMapper.deleteOrdr(vo);
		}
	}

	// 거래처 목록 조회 모달창
	@Override
	public List<VendVO> comSearch(VendVO vo) {
		return salesMapper.comSearch(vo);
	}

	@Override
	public List<SalesVO> proSearch(SalesVO vo) {
		// TODO Auto-generated method stub
		return salesMapper.proSearch(vo);
	}

	// 주문번호 생성, 가져오기
	@Override
	public SalesVO getordrNo(SalesVO vo) {
		return salesMapper.getordrNo(vo);
	}

	// 주문서 수정저장
	@Override
	public void saveOrdr(List<SalesVO> ordList) {
		for (SalesVO vo : ordList) {
			salesMapper.saveOrdr(vo);
		}
	}

////////////////////////////////////////////////////////////////
	// saleslst.jsp 페이지
	// 제품 입고 목록 현재 날짜 기준으로 조회(첫페이지)
	@Override
	public List<SalesIstVO> salesIstList(SalesIstVO vo) {
		return salesMapper.salesIstList(vo);
	}

	// 제품 입고 목록 조건별 조회
	@Override
	public List<SalesIstVO> istOptionList(SalesIstVO vo) {
		return salesMapper.istOptionList(vo);
	}

}
