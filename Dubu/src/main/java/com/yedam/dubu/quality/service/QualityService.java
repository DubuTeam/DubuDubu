package com.yedam.dubu.quality.service;

import java.util.List;

public interface QualityService {
	
	//조회
	public List<QualityVO> selectQualityList();
	//조회
	public List<QualityVO> getPrdtInsp(QualityVO qualityVO);
	
	public List<QualityVO> getPrdtInspDtl(QualityVO qualityVO);
	
	//입고검사등록
	
	List<QualityVO> getMatVendList(QualityVO qualityVO);
    List<QualityVO> getMatOrdrList(QualityVO qualityVO);
    
    //자재관련조회
  //  List<QualityVO> getResources(QualityVO qualityVO);
    // 검사상세
    List<QualityVO> getInfCdList();
}
