package com.yedam.dubu.equipment.service;

import java.util.List;

public interface EquipmentService {

	// 전체 조회
	public List<EquipmentVO> selectAllEquipmentLineList();


	// 자동으로 부여될 라인코드
	public String getLineCode();
	
	
	// 등록	(1개가 성공적으로 insert 되는 경우 숫자 1을 반환 받음)
	public int insertEquipmentLine(EquipmentVO equipmentVO);
	
	
	// 수정
	public int updateEquipmentLine(EquipmentVO equipmentVO);
	
	
	
	// 삭제
	public int deleteEquipmentLine(EquipmentVO equipmentVO);
	
	
	/////////////////////////////////////////////////////////////////////////
	
	
	// 설비관리 테이블
	
	// 공정명, 공정코드 가져오기 위한 것.
	public List<EquipmentVO> selectAllProcessList();
	
	
	// 공통코드 테이블 (CCDS)
	
	// 설비구분 탭의 설비구분 코드 및 설비코드 가져오기 위함.
	public List<EquipmentVO> selectAllCommonDataList();
	
	
	// 설비 목록 출력하기
	public List<EquipmentVO> selectAllEquipmentList();
	
	
	// 설비 등록하기
	public int insertEquipment(EquipmentVO equipmentVO);
}