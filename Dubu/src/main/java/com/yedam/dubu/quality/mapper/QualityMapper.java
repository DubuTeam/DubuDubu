package com.yedam.dubu.quality.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.dubu.quality.service.QualityVO;

public interface QualityMapper {
	
	//조회
	public List<QualityVO> selectQualityList();
	//조회
	public List<QualityVO> getPrdtInsp(QualityVO qualityVO);
	
	public List<QualityVO> getPrdtInspDtl(QualityVO qualityVO);
	
	
		//입고검사등록
	
		List<QualityVO> getMatVendList(QualityVO qualityVO);
	    List<QualityVO> getMatOrdrList(QualityVO qualityVO);
	    
	    //자재관련조회
	   // List<QualityVO> getResources(QualityVO qualityVO);
	    
	    // 검사상세
	    List<QualityVO> getInfCdList();
	    void setRscInfList(@Param("insp") QualityVO insp, @Param("inf") QualityVO inf);
}
