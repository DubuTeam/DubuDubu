package com.yedam.dubu.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;

@Controller
public class SalesController {
	@Autowired
	SalesService salesService;

	// 주문서 관리
	@GetMapping("/orderList")
	public String searchSales(@RequestParam(name = "vendNm", required = false) String vendNm,
							  @RequestParam(name = "prdtNm", required = false) String prdtNm,
							  @RequestParam(name = "orderDt", required = false) String orderDt, 
							  Model model) {
	List<SalesVO> salesList = salesService.searchSalesList(vendNm, prdtNm, orderDt);
	model.addAttribute("salesList", salesList);
		
	return "sales/orderList";
	}

	// 제품입고등록
	@GetMapping("/salesIst")

	public String salesIst(Model model) {
		return "sales/salesIst";
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
