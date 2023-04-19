package com.yedam.dubu.quality.service;

import java.util.List;

import com.yedam.dubu.equipment.service.EquipmentVO;

public interface QualityService {

	// 조회
	public List<QualityVO> selectQualityList();

	// 조회
	public List<QualityVO> getPrdtInsp(QualityVO qualityVO);

	public List<QualityVO> getPrdtInspDtl(QualityVO qualityVO);

	// 입고검사등록

	List<QualityVO> getMatVendList(QualityVO qualityVO);

	List<QualityVO> getMatOrdrList(QualityVO qualityVO);

	void setRscInspList(List<RscInspVO> rscInspVOS);

	// 자재관련조회
	// List<QualityVO> getResources(QualityVO qualityVO);

	// 검사상세
	List<QualityVO> getInfCdList();

	// 입고검사 수정
	List<RscInspVO> schRscInspHist(RscInspVO rscInspVO);

	// 업데이트
	public int upRscProg(List<RscInspVO> rscInspVO);
	//삭제
	void delRscInspHistAll(List<RscInspVO> rscInspVOS);
	// 직원 목록 모달 내에서, 직원 목록 출력
	public List<RscInfVO> selectAllEmpListInModal();
	

}
