package com.yedam.dubu.equipment.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.equipment.mapper.EquipmentMapper;
import com.yedam.dubu.equipment.service.EquipmentService;
import com.yedam.dubu.equipment.service.EquipmentVO;

@Service
public class EquipmentServiceImpl implements EquipmentService{

	@Autowired
	EquipmentMapper equipmentMapper;

	@Override
	public List<EquipmentVO> selectAllEquipmentLineList() {
		return equipmentMapper.selectAllEquipmentLineList();
	}

	@Override
	public String getLineCode() {		
		return equipmentMapper.getLineCode();
	}

	@Override
	public int insertEquipmentLine(EquipmentVO equipmentVO) {
		// int result = equipmentMapper.insertEquipmentLine(equipmentVO);
		// ↑↑↑ 이거 주석 해제하면 에러 발생 (insert 2번 해서 제약조건 에러 뜸)   -> 위처럼 쓰려면, 아예 리턴문도 바꾸거나 알맞게 없애야 함.
		// System.out.println("insert 출력 ->  " + result + "개");
		
		System.out.println("insert 출력!");
		
		return equipmentMapper.insertEquipmentLine(equipmentVO);
	}

	@Override
	public int updateEquipmentLine(EquipmentVO equipmentVO) {
		int result = equipmentMapper.updateEquipmentLine(equipmentVO);
		System.out.println("업데이트 출력 ->  " + result + "개");
		
		return equipmentMapper.updateEquipmentLine(equipmentVO);
	}

	@Override
	public int deleteEquipmentLine(EquipmentVO equipmentVO) {
		int result = equipmentMapper.deleteEquipmentLine(equipmentVO);
		System.out.println("삭제 출력 ->  " + result + "개");
		
		return equipmentMapper.deleteEquipmentLine(equipmentVO);
	}

	
	/////////////////////////////////////////////////////////////////////////
	
	
	// 설비관리 테이블
	
	// 공정코드, 공정명 가져오기 위한 메서드
	@Override
	public List<EquipmentVO> selectAllProcessList() {
		return equipmentMapper.selectAllProcessList();
	}

	@Override
	public List<EquipmentVO> selectAllCommonDataList() {
		return equipmentMapper.selectAllCommonDataList();
	}

	
	///
	
	@Override
	public List<EquipmentVO> selectAllEquipmentList() {
		return equipmentMapper.selectAllEquipmentList();
	}

	@Override
	public int insertEquipment(EquipmentVO equipmentVO) {
		return equipmentMapper.insertEquipment(equipmentVO);
	}

	@Override
	public int updateEquipment(EquipmentVO equipmentVO) {
		return equipmentMapper.updateEquipment(equipmentVO);
	}

	@Override
	public int deleteEquipment(String eqmCd) {
		return equipmentMapper.deleteEquipment(eqmCd);
	}

	@Override
	public List<EquipmentVO> selectSpecificEquipmentList(EquipmentVO equipmentVO) {		
		return equipmentMapper.selectSpecificEquipmentList(equipmentVO);
	}

	
	/////////////////////////////////////////////////////////////////////////
	
	
	@Override
	public List<EquipmentVO> selectAllEquipmentListInModal() {
		return equipmentMapper.selectAllEquipmentListInModal();
	}

	@Override
	public List<EquipmentVO> selectSpecificEquipmentListInModal(EquipmentVO equipmentVO) {
		return equipmentMapper.selectSpecificEquipmentListInModal(equipmentVO);
	}

	@Override
	public List<EquipmentVO> selectAllCheckList() {
		return equipmentMapper.selectAllCheckList();
	}

	@Override
	public String getCheckCode() {
		return equipmentMapper.getCheckCode();
	}
	
	@Override
	public int insertCheckList(EquipmentVO equipmentVO) {
		return equipmentMapper.insertCheckList(equipmentVO);
	}

	@Override
	public int updateCheckList(EquipmentVO equipmentVO) {
		return equipmentMapper.updateCheckList(equipmentVO);
	}
		

	
}