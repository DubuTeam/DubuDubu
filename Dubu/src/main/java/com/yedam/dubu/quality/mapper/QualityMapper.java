package com.yedam.dubu.quality.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.dubu.equipment.service.EquipmentVO;
import com.yedam.dubu.quality.service.QualityVO;
import com.yedam.dubu.quality.service.RscInfVO;
import com.yedam.dubu.quality.service.RscInspVO;

public interface QualityMapper {
	
	//조회
	public List<QualityVO> selectQualityList();
	//조회
	public List<QualityVO> getPrdtInsp(QualityVO qualityVO);
	
	public List<QualityVO> getPrdtInspDtl(QualityVO qualityVO);
	
		//업데이트
		int upRscProg(RscInspVO rscInspVO); // 검사완료
		//입고검사등록
	
		List<QualityVO> getMatVendList(QualityVO qualityVO);
	    List<QualityVO> getMatOrdrList(QualityVO qualityVO);
	    void updRscOrdrRmnCnt(RscInspVO rscInspVO);
	    
	    //자재관련조회
	   // List<QualityVO> getResources(QualityVO qualityVO);
	    
	    // 검사상세
	    void setRscInspList(RscInspVO rscInspVOS);
	    void setRscInsp(RscInspVO rscInspVO);
	    void setRscInfList(@Param("insp") RscInspVO rscInspVO, @Param("inf") RscInfVO rscInfVO);
	    
	    
	    String genRscNoOrdrCd();  //검사코드
	    String genRscInspCd();
	    List<QualityVO> getInfCdList();
	    
	 // 입고검사수정
	    List<RscInspVO> schRscInspHist(RscInspVO rscInspVO);
	    
	    
	    // 삭제
	    void delRscInspHist(RscInspVO rscInspVO);
	    void delRscInspHistSingle(RscInspVO rscInspVO);
	    
	    // 직원 목록 모달 내에서, 직원 목록 출력
	 	public List<RscInfVO> selectAllEmpListInModal();
	   
	    
}
