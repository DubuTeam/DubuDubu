package com.yedam.dubu.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.sales.service.PrdtInspVO;
import com.yedam.dubu.sales.service.SalesIstVO;
import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;

@Controller
public class SalesController {
	@Autowired
	SalesService salesService;

	// 제품입고등록
	@GetMapping("/salesIst")

	public String salesIst(Model model) {
		return "sales/salesIst";
	}

	// 첫페이지 날짜별 조회
	@PostMapping("salesIstList")
	@ResponseBody
	public List<SalesIstVO> salesIstList(SalesIstVO vo) {
		return salesService.salesIstList(vo);
	}

	

	// 제품 입고 목록 조건별 조회
	@PostMapping("istOptionList")
	@ResponseBody
	public List<SalesIstVO> istOptionList(SalesIstVO vo) {
		return salesService.istOptionList(vo);
	}

	// 완제품LOT번호 모달 조회
	@RequestMapping("getLotList")
	@ResponseBody
	public List<PrdtInspVO> getLotList(PrdtInspVO vo) {
		return salesService.getLotList(vo);
	}

	// 제품 입고 등록&수정
	@PostMapping("saveIst")
	@ResponseBody
	public List<SalesIstVO> saveIst(SalesIstVO vo) {
		salesService.saveIst(vo);
		return salesService.salesIstList(vo);
	}

	// 입고등록 후 진행상황 입고완료로 변경
	@PostMapping("modifyProg")
	@ResponseBody
	public SalesVO modifyProg(SalesVO vo) {
		System.out.println(vo.getProdOrderDetailCd());
		salesService.modifyProg(vo);
		return vo;
	}

	// 주문번호 생성, 가져오기
	@GetMapping("getlstNo")
	@ResponseBody
	public SalesVO getlstNo(SalesVO vo) {
		return salesService.getlstNo(vo);
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
