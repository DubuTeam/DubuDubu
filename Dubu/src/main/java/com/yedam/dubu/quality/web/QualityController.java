package com.yedam.dubu.quality.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.quality.service.QualityService;
import com.yedam.dubu.quality.service.QualityVO;

@Controller
public class QualityController {

	@Autowired
	QualityService qualityService;
	
	// 제품검사관리
	@GetMapping("/prdtInsp")
	public String getPrdtInsp(Model model) {
		model.addAttribute("getPrdtInsp",qualityService.selectQualityList());
		return "quality/prdtInsp";
	}
	@PostMapping("/prdtInsp")
	@ResponseBody
	public List<QualityVO>PrdtInsp2(QualityVO qualityVO) {
		
		return null;
	}
	
	// 자재입고검사관리
	@GetMapping("/materialInsp")
	public String getMaterialInsp(Model model) {
		return "quality/materialInsp";
	}
	
}
