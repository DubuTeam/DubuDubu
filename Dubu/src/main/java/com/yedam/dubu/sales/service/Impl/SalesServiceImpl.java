package com.yedam.dubu.sales.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.sales.mapper.SalesMapper;
import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;

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
	//주문서 삭제
	@Override
	public void deleteOrdr(List<SalesVO> delList) {
		for (SalesVO vo : delList) {
			salesMapper.deleteOrdr(vo);
		}

	}




	
	
}
