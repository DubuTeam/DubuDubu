package com.yedam.dubu.production.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.dubu.production.service.ProductionService;

@Controller
public class ProductionController {

	@Autowired
	ProductionService ProductionService;
	
	// 생산지시
	@GetMapping("indica")
	public String getIndica(Model model){
		return "production/indica";
	}
	
	// 생산지시조회
	@GetMapping("indicaSearch")
	public String getIndicaSearch(Model model){
		return "production/indicaSearch";
	}
	
	// 생산계획
	@GetMapping("plan")
	public String getPlan(Model model){
		return "production/plan";
	}
	
	// 공정실적조회
	@GetMapping("prcsSearch")
	public String getPrcsSearch(Model model){
		return "production/prcsSearch";
	}
	
	// 생산관리
	@GetMapping("progMng")
	public String getprogMng(Model model){
		return "production/progMng";
	}
	
	// 제품공정흐름관리
	@GetMapping("prcProcess")
	public String getprcProcessg(Model model){
		return "production/prcProcess";
	}
}
