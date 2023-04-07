package com.yedam.dubu.quality.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.quality.mapper.QualityMapper;
import com.yedam.dubu.quality.service.QualityService;
import com.yedam.dubu.quality.service.QualityVO;

@Service
public class QualityServiceImpl implements QualityService {

	@Autowired
	QualityMapper qualityMapper;

	@Override
	public List<QualityVO> selectQualityList() {
		
		return qualityMapper.selectQualityList();
	}
}
