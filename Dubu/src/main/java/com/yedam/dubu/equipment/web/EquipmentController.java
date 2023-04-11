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
	@ResponseBody			// ajax 랑 데이터를 주고 받을 때, 객체로 보내고 객체로 받기 위해서 @ResponseBody 사용
	public String equipmentInsertProcess(EquipmentVO equipmentVO) {
		equipmentService.insertEquipment(equipmentVO);		// <- 여기서..정보가 담긴 VO 객체를 가지고, 직접적인 DB 랑 연결.
		
		return "redirect:eqLine";
	}
	

	@PostMapping("/updateEqLine")
	@ResponseBody
	public String equipmentUpdateProcess(EquipmentVO equipmentVO) {
		equipmentService.updateEquipment(equipmentVO);
		
		return "redirect:eqLine";
	}
	

	@PostMapping("/deleteEqLine")
	public String deleteEqLine(EquipmentVO equipmentVO) {
		equipmentService.deleteEquipment(equipmentVO);
		return "redirect:eqLine";
	}
	

	///////////////////////////////////////////////////////////////////////////
	
	
	// 설비관리
	@GetMapping("/eq")
	public String getEq(Model model) {
		// 라인명 탭에서 쓸 옵션들 받기 위해서 보냄
		model.addAttribute("eqLineList", equipmentService.selectAllEquipmentList());
		model.addAttribute("processList", equipmentService.selectAllProcessList());
		
		return "equip/eq";
	}

	
	///////////////////////////////////////////////////////////////////////////
	
	
	// 설비점검관리
	@GetMapping("/eqCheck")
	public String getEqCheck(Model model) {
		return "equip/eqCheck";
	}
	
	
	///////////////////////////////////////////////////////////////////////////
	
	
	// 비가동관리
	@GetMapping("/eqIpopr")
	public String getEqIpopr(Model model) {
		return "equip/eqIpopr";
	}
	
	
	///////////////////////////////////////////////////////////////////////////
	
	
	// 실시간설비상태
	@GetMapping("/equIp")
	public String getEquIp(Model model) {
		return "equip/equIp";
	}
}
