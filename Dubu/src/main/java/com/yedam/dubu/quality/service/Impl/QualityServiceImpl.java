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

	@Override
	public List<QualityVO> getPrdtInsp(QualityVO qualityVO) {

		return qualityMapper.getPrdtInsp(qualityVO);
	}

	@Override
	public List<QualityVO> getPrdtInspDtl(QualityVO qualityVO) {
	
		return qualityMapper.getPrdtInspDtl(qualityVO);
	}
	//입고검사등록
	@Override
	public List<QualityVO> getMatVendList(QualityVO qualityVO) {
		// TODO Auto-generated method stub
		return qualityMapper.getMatVendList(qualityVO) ;
	}

	@Override
	public List<QualityVO> getMatOrdrList(QualityVO qualityVO) {
		// TODO Auto-generated method stub
		return qualityMapper.getMatOrdrList(qualityVO);
	}

	@Override
	public List<QualityVO> getResources(QualityVO qualityVO) {
		// TODO Auto-generated method stub
		return qualityMapper.getResources(qualityVO);
	}

	
}


