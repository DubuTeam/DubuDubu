package com.yedam.dubu.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.sales.service.SalesIstVO;
import com.yedam.dubu.sales.service.SalesService;

@Controller
public class SalesController {
	@Autowired
	SalesService salesService;

	// 제품입고등록
	@GetMapping("/salesIst")

	public String salesIst(Model model) {
		return "sales/salesIst";
	}

	// 제품 입고 목록 현재 날짜 기준으로 조회(첫페이지)
	@GetMapping("salesIstList")
	@ResponseBody
	public List<SalesIstVO> salesIstList(SalesIstVO vo) {
		return salesService.salesIstList(vo);
	}

	// 제품입고조회
	@GetMapping("/salesIstSearch")
	public String salesIstSearch(Model model) {
		return "sales/salesIstSearch";
	}

	// 제품출고등록
	@GetMapping("/salesOust")
	public String salesOust(Model model) {
		return "sales/salesOust";
	}

	// 제품출고조회
	@GetMapping("/salesOustSearch")
	public String salesOustSearch(Model model) {
		return "sales/salesOustSearch";
	}

	// 완제품LOT 재고조회
	@GetMapping("/salesStc")
	public String salesStc(Model model) {
		return "sales/salesStc";
	}
}
