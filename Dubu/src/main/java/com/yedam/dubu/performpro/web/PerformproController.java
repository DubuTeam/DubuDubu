package com.yedam.dubu.performpro.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.performpro.service.PerformproService;
import com.yedam.dubu.performpro.service.PerformproVO;

@Controller
public class PerformproController {

	@Autowired
	PerformproService performproService;
	
	// 공정실적관리 페이지
	@GetMapping("/progMng")
	public String getprogMng(Model model){
		return "production/progMng";
	}
	
	// 생산지시 헤더 리스트
	@PostMapping("/getIndicaHeader")
	@ResponseBody
	public List<PerformproVO> getIndicaHeader(){
		return performproService.indicaHeader();
	}
	
}
