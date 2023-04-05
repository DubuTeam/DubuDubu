package com.yedam.dubu.equipment.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.equipment.mapper.EquipmentMapper;
import com.yedam.dubu.equipment.service.EquipmentService;

@Service
public class EquipmentServiceImpl implements EquipmentService{

	@Autowired
	EquipmentMapper equipmentMapper;
	
}
