package com.yedam.dubu.equipment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yedam.dubu.equipment.service.EquipmentService;

@Controller
public class EquipmentController {

	@Autowired
	EquipmentService equipmentService;
	
	
}
