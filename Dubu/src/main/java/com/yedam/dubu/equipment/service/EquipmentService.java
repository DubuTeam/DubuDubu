package com.yedam.dubu.equipment.service;

import java.util.List;

public interface EquipmentService {

	// 1. 설비 라인 테이블
	
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
	
	
	// 2. 설비 관리 테이블
	
	// 공정명, 공정코드 가져오기 위한 것.
	public List<EquipmentVO> selectAllProcessList();
	
	
	// 공통코드 테이블 (CCDS)
	
	// 설비구분 탭의 설비구분 코드 및 설비코드 가져오기 위함.
	// public List<EquipmentVO> selectAllCommonDataList();
	
	// 테스트 - 자동으로 부여될 설비 코드
	public String getEqCode();
	
	// 가동중인 라인만 라인명 옵션에 뜨도록
	public List<EquipmentVO> getEqLineOption();
	
	// 설비 목록 출력하기
	public List<EquipmentVO> selectAllEquipmentList();
	
	
	// 설비 등록하기
	public int insertEquipment(EquipmentVO equipmentVO);
	
	// 설비 수정하기
	public int updateEquipment(EquipmentVO equipmentVO);
	
	// 설비 삭제하기
	public int deleteEquipment(String eqmCd);
	
	// 설비 검색하기
	public List<EquipmentVO> selectSpecificEquipmentList(EquipmentVO equipmentVO);
	
	
	/////////////////////////////////////////////////////////////////////////
	
	
	// 3. 설비 점검 내역 테이블
	
	// 모달 내에서 설비 목록 출력하기
	public List<EquipmentVO> selectAllEquipmentListInModal();
	
	// 모달 내에서 설비 검색 기능
	public List<EquipmentVO> selectSpecificEquipmentListInModal(EquipmentVO equipmentVO);
	
	// 전체 점검 조회
	public List<EquipmentVO> selectAllCheckList();
	
	// 자동으로 부여될 점검코드
	public String getCheckCode();
	
	// 설비 점검 등록하기
	public int insertCheckList(EquipmentVO equipmentVO);
	
	// 설비 점검 수정하기
	public int updateCheckList(EquipmentVO equipmentVO);
	
	// 설비 점검 삭제하기
	public int deleteCheckList(String chckCd);
	
	// 설비 점검 검색하기
	public List<EquipmentVO> selectSpecificEqCheckList(EquipmentVO equipmentVO);
	
	
	/////////////////////////////////////////////////////////////////////////
	
	
	// 4. 비가동 관리 테이블
	
	// 전체 비가동 조회
	public List<EquipmentVO> selectAllEqIpoprList();
	
	// 현재 가동중이지 않은 설비들을 설비명 옵션에 뜨도록
	public List<EquipmentVO> eqIpoprOption();
	
	// 자동으로 부여될 비가동 코드
	public String getNoprCode();
	
	// 비가동 등록하기
	public int insertEqIpopr(EquipmentVO equipmentVO);
	
	// 비가동 수정하기
	public int updateEqIpopr(EquipmentVO equipmentVO);
	
	// 비가동 삭제하기
	public int deleteEqIpopr(String noprCd);
	
	// 비가동 검색하기
	public List<EquipmentVO> selectSpecificEqIpoprList(EquipmentVO equipmentVO);
}