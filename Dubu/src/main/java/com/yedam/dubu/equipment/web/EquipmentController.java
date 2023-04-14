package com.yedam.dubu.equipment.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.equipment.service.EquipmentService;
import com.yedam.dubu.equipment.service.EquipmentVO;

@Controller
public class EquipmentController {

	@Autowired
	EquipmentService equipmentService;
	
	// 1. 라인 관리 페이지
	@GetMapping("/eqLine")
	public String getEqLine(Model model) {
		model.addAttribute("eqLineList", equipmentService.selectAllEquipmentLineList());
		model.addAttribute("getLineCode", equipmentService.getLineCode());				// 다음 라인 코드를 input 태그에 미리 적어줌

		return "equip/eqLine";
	}
	
	
	@PostMapping("/insertEqLine")
	@ResponseBody			// ajax 랑 데이터를 주고 받을 때, 객체로 보내고 객체로 받기 위해서 @ResponseBody 사용
	public String eqLineInsertProcess(EquipmentVO equipmentVO) {
		equipmentService.insertEquipmentLine(equipmentVO);		// <- 여기서..정보가 담긴 VO 객체를 가지고, 직접적인 DB 랑 연결.
		
		return "redirect:eqLine";
	}
	

	@PostMapping("/updateEqLine")
	@ResponseBody
	public String eqLineUpdateProcess(EquipmentVO equipmentVO) {
		equipmentService.updateEquipmentLine(equipmentVO);
		
		return "redirect:eqLine";
	}
	

	@PostMapping("/deleteEqLine")
	public String deleteEqLine(EquipmentVO equipmentVO) {
		equipmentService.deleteEquipmentLine(equipmentVO);
		return "redirect:eqLine";
	}
	

	///////////////////////////////////////////////////////////////////////////
	
	
	// 2. 설비 관리 페이지
	@GetMapping("/eq")
	public String getEq(Model model) {
		// 설비구분/라인명/공정명 탭에서 쓸 옵션들 받기 위해서 보냄
		model.addAttribute("commonDataList", equipmentService.selectAllCommonDataList());
		model.addAttribute("eqLineList", equipmentService.selectAllEquipmentLineList());
		model.addAttribute("processList", equipmentService.selectAllProcessList());
		
		// 설비 목록을 전체 출력하기 위해서 보냄
		model.addAttribute("eqList", equipmentService.selectAllEquipmentList());
		
		return "equip/eq";
	}

	
	@PostMapping("/insertEq")
	@ResponseBody
	public String eqInsertProcess(EquipmentVO equipmentVO) {
		equipmentService.insertEquipment(equipmentVO);
		
		return "redirect:eq";
	}
	
	
	@PostMapping("/updateEq")
	@ResponseBody
	public String eqUpdateProcess(EquipmentVO equipmentVO) {
		equipmentService.updateEquipment(equipmentVO);
		return "redirect:eq";
	}
	
	@PostMapping("/deleteEq")
	@ResponseBody
	public String deleteEq(String eqmCd) {
		equipmentService.deleteEquipment(eqmCd);
		return "redirect:eq";
	}
	
	// 설비 검색
	@GetMapping("/searchEq")
	@ResponseBody
	public List<EquipmentVO> getSpecificEq(EquipmentVO equipmentVO, @RequestParam String searchType, @RequestParam String keyword) {
		// 설비 검색 시 필요한 거..? (기존 "eqList" 삭제 후, 아래의 "specificEqList" 를 불러야 하나..?)
//		model.addAttribute("specificEqList", equipmentService.selectSpecificEquipmentList());
		equipmentVO.setSearchType(searchType);
		equipmentVO.setKeyword(keyword);
		
		
		
		return equipmentService.selectSpecificEquipmentList(equipmentVO);
		
	}
	
	///////////////////////////////////////////////////////////////////////////
	
	
	// 3. 설비 점검 관리 페이지
	@GetMapping("/eqCheck")
	public String getEqCheck(Model model) {
		// 모달 내 설비 전체 출력
		model.addAttribute("eqListInModal", equipmentService.selectAllEquipmentListInModal());
		
		// 모달 밖, 아래에다 점검 리스트 출력
		model.addAttribute("checkList", equipmentService.selectAllCheckList());
		
		// 자동 점검코드
		model.addAttribute("getCheckCode", equipmentService.getCheckCode());
		return "equip/eqCheck";
	}


	// 모달 내 설비 검색
	@GetMapping("/searchEqInModal")
	@ResponseBody
	public List<EquipmentVO> getSpecificEqInModal(EquipmentVO equipmentVO, @RequestParam String keyword) {
		System.out.println(keyword + " 받았습니다!");
		equipmentVO.setKeyword(keyword);
		return equipmentService.selectSpecificEquipmentListInModal(equipmentVO);
	}
	
	
	// 점검 목록 추가
	@PostMapping("/insertCheckList")
	@ResponseBody
	public String checkInsertProcess(EquipmentVO equipmentVO) {
		equipmentService.insertCheckList(equipmentVO);		// <- 여기서..정보가 담긴 VO 객체를 가지고, 직접적인 DB 랑 연결.
		
		return "redirect:eqCheck";
	}
	
	// 점검 목록 수정
	@PostMapping("/updateCheckList")
	@ResponseBody
	public String checkUpdateProcess(EquipmentVO equipmentVO) {
		equipmentService.updateCheckList(equipmentVO);
		return "redirect:eqCheck";
	}
	
	
	@PostMapping("/deleteCheckList")
	@ResponseBody
	public String deleteCheckList(String chckCd) {
		equipmentService.deleteCheckList(chckCd);
		return "redirect:eqCheck";
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
