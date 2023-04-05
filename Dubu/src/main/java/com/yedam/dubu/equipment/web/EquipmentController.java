package com.yedam.dubu.equipment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.dubu.equipment.service.EquipmentService;

@Controller
public class EquipmentController {

	@Autowired
	EquipmentService equipmentService;
	
	// 라인관리
	@GetMapping("/eqLine")
	public String getEqLine(Model model) {
		return "equip/eqLine";
	}
	
	// 설비관리
	@GetMapping("/eq")
	public String getEq(Model model) {
		return "equip/eq";
	}
	
	// 설비점검관리
	@GetMapping("/eqCheck")
	public String getEqCheck(Model model) {
		return "equip/eqCheck";
	}
	
	// 비가동관리
	@GetMapping("/eqIpopr")
	public String getEqIpopr(Model model) {
		return "equip/eqIpopr";
	}
	
	// 실시간설비상태
	@GetMapping("/equIp")
	public String getEquIp(Model model) {
		return "equip/equIp";
	}
	
	
}
