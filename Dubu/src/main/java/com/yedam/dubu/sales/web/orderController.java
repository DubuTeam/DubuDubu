package com.yedam.dubu.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;
import com.yedam.dubu.sales.service.VendVO;

@Controller
public class orderController {
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
	@PostMapping("deleteOrdr")
	public String deleteOrdr(@RequestBody List<SalesVO> delList) {
		salesService.deleteOrdr(delList);
		return "sales/orderList";
	}

	// 거래처 목록 조회 모달창
	@RequestMapping("/comSearch")
	@ResponseBody
	public List<VendVO> comSearch(VendVO vo) {
		return salesService.comSearch(vo);
	}

	// 제품명 목록 조회 모달창
	@RequestMapping("proSearch")
	@ResponseBody
	public List<SalesVO> proSearch(SalesVO vo) {
		return salesService.proSearch(vo);
	}

	// 주문번호 생성, 가져오기
	@GetMapping("getordrNo")
	@ResponseBody
	public SalesVO getordrNo(SalesVO vo) {
		System.out.println(vo.getOrderDt());
		return salesService.getordrNo(vo);
	}

	// 주문서 수정저장
	@PostMapping("saveOrdr")
	public String saveOrdr(@RequestBody List<SalesVO> ordList) {
		salesService.saveOrdr(ordList);
		return "sales/orderList";
	}

}
