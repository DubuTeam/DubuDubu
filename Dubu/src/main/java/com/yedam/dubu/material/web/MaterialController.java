package com.yedam.dubu.material.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.dubu.material.service.MaterialService;

@Controller
public class MaterialController {
	@Autowired
	MaterialService materialService;
	
	// 자재입고검사
	@GetMapping("materialInsp")
	public String getMaterialInsp(Model model) {
		return "material/materialInsp";
	}
	
	// 자재입고검사조회
	@GetMapping("materialInspList")
	public String getMaterialInspList(Model model) {
		return "material/materialInspList";
	}
	
}
