package com.yedam.dubu.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;

@Controller
public class SalesController {
	@Autowired
	SalesService salesService;

	// 제품입고등록
		@GetMapping("/orderList")
		public String orderlist(Model model) {
			return "sales/orderList";
		}
	
	// 주문서 조회/등록 페이지 불러오기
	@RequestMapping("/orderSelect")
	public String orderList() {
		return "sales/orderList";
	}

	// 주문서 전체 불러오기
	@PostMapping("/orderList")
	@ResponseBody
	public List<SalesVO> orderSelect(SalesVO vo) {
		return salesService.searchOrdr(vo);
	}
	


	// 조건별 주문서 조회
	@PostMapping("/findOrdr")
	@ResponseBody
	public List<SalesVO> findOrdr(SalesVO vo) {
		System.out.println(vo);
		return salesService.findOrdr(vo);

	}

	// 주문서 삭제
	@DeleteMapping("/deleteOrdr")
	public String deleteOrdr(@RequestBody List<SalesVO> delList) {
	    salesService.deleteOrdr(delList);
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
