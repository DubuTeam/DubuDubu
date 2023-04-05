package com.yedam.dubu.quality.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.dubu.quality.service.QualityService;

@Controller
public class QualityController {

	@Autowired
	QualityService qualityService;
	
	// 제품검사관리
	@GetMapping("/prdtInsp")
	public String getPrdtInsp(Model model) {
		return "quality/prdtInsp";
	}
	
	// 자재입고검사관리
	@GetMapping("/materialInsp")
	public String getMaterialInsp(Model model) {
		return "quality/materialInsp";
	}
	
}
