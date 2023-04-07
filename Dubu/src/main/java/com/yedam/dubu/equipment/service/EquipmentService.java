package com.yedam.dubu.equipment.service;

import java.util.List;

public interface EquipmentService {

	// 전체 조회
	public List<EquipmentVO> selectAllEquipmentList();


	// 자동으로 부여될 라인코드
	public String getLineCode();
	
	
	// 등록	(1개가 성공적으로 insert 되는 경우 숫자 1을 반환 받음)
	public int insertEquipment(EquipmentVO equipmentVO);
	
	
	// 수정
	public int updateEquipment(EquipmentVO equipmentVO);
	
	
	
	// 삭제
	public int deleteEquipment(EquipmentVO equipmentVO);
}