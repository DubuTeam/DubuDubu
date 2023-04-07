package com.yedam.dubu.quality.mapper;

import java.util.List;

import com.yedam.dubu.quality.service.QualityVO;

public interface QualityMapper {
	
	//조회
	public List<QualityVO> selectQualityList();
}
