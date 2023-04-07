package com.yedam.dubu.equipment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.equipment.service.EquipmentService;
import com.yedam.dubu.equipment.service.EquipmentVO;

@Controller
public class EquipmentController {

	@Autowired
	EquipmentService equipmentService;
	
	// 1. 라인관리
	@GetMapping("/eqLine")
	public String getEqLine(Model model) {
		model.addAttribute("eqLineList", equipmentService.selectAllEquipmentList());
		model.addAttribute("getLineCode", equipmentService.getLineCode());				// 다음 라인 코드를 input 태그에 미리 적어줌

		return "equip/eqLine";
	}
	
	
	@PostMapping("/insertEqLine")
	@ResponseBody
	public String equipmentInsertProcess(EquipmentVO equipmentVO) {
		equipmentService.insertEquipment(equipmentVO);
		
		return "redirect:eqLine";
	}
	

	@PostMapping("/updateEqLine")
	@ResponseBody
	public String equipmentUpdateProcess(EquipmentVO equipmentVO) {
		equipmentService.updateEquipment(equipmentVO);
		
		return "redirect:eqLine";
	}
	

//	@GetMapping("/deleteEqLine")
//	public String deleteEqLine()
	

	///////////////////////////////////////////////////////////////////////////
	
	
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
