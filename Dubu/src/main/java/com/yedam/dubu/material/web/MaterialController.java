package com.yedam.dubu.material.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.material.service.MaterialService;
import com.yedam.dubu.material.service.MaterialVO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class MaterialController {
	@Autowired
	MaterialService materialService;
	
	// 자재발주(모달)
	@GetMapping("/materialOrderAdd")
	public String getMaterialOrderAdd(Model model) {
		return "material/materialOrderAdd";
	}
	
	// 자재발주
	@GetMapping("/materialOrder")
	public String getMaterialOrder(Model model) {
		model.addAttribute("materialList",materialService.getMaterialList());
		return "material/materialOrder";
	}
	
	 // 자재발주
	// @PostMapping("/materialOrder")
	// public List<MaterialVO> postMaterialOrder() {
	// System.out.println(model); return 
	//}
	 
		
	// 자재발주조회
	@GetMapping("/materialOrderSearch")
	public String getMaterialOrderSearch(Model model) {
		return "material/materialOrderSearch";
	}
		
	// 자재입고검사조회
	@GetMapping("/materialInspList")
	public String getMaterialInspList(Model model) {
		return "material/materialInspList";
	}
	
	// 자재입고관리
	@GetMapping("/materialIst")
	public String getMaterialIist(Model model) {
		return "material/materialIst";
	}
	
	// 자재입고조회
	@GetMapping("/materialIstList")
	public String getMaterialIstList(Model model) {
		return "material/materialIstList";
	}
	
	// 원자재출고관리
	@GetMapping("/materialOust")
	public String getMaterialOust(Model model) {
		return "material/materialOust";
	}
	
	// 원자재출고조회
	@GetMapping("/materialOustList")
	public String getMaterialOustList(Model model) {
		return "material/materialOustList";
	}
	
	// 자재재고조회
	@GetMapping("/materialStcList")
	public String getMaterialStcList(Model model) {
		return "material/materialStcList";
	}
	
	// 자재LOT재고조회
	@GetMapping("/materialLOTList")
	public String getMaterialLOTList(Model model) {
		return "material/materialLotList";
	}
	
	// 자재입/출고조회
	@GetMapping("/materialIOList")
	public String getMaterialIOList(Model model) {
		return "material/materialIOList";
	}
	
}
