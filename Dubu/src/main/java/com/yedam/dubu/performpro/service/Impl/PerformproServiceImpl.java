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
	PerformproMapper PerformproMapper;

	// 생산지시 헤더 리스트
	@Override
	public List<PerformproVO> indicaHeader() {
		return PerformproMapper.indicaHeader();
	}
	
	

	

}
	 





