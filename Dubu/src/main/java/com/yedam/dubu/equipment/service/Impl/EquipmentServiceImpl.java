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
	public List<EquipmentVO> selectAllEquipmentList() {
		return equipmentMapper.selectAllEquipmentList();
	}

	@Override
	public String getLineCode() {		
		return equipmentMapper.getLineCode();
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
	public int deleteEquipment(EquipmentVO equipmentVO) {
		return equipmentMapper.deleteEquipment(equipmentVO);
	}
}