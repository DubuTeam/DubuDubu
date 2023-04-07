package com.yedam.dubu.equipment.service;

import java.util.List;

public interface EquipmentService {

	// 전체 조회
	public List<EquipmentVO> selectAllEquipmentList();


	// 자동으로 부여될 라인코드
	public String getLineCode();
	
	
	// 등록
	public int insertEquipment(EquipmentVO equipmentVO);
	
	
	// 수정
	public int updateEquipment(EquipmentVO equipmentVO);
	
	
	
	// 삭제
	public int deleteEquipment(EquipmentVO equipmentVO);
}