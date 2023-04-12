package com.yedam.dubu.sales.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.sales.service.SalesService;
import com.yedam.dubu.sales.service.SalesVO;

@Controller
public class OustController {

	@Autowired
	SalesService salesService;

	// 진행중 주문서 현황 목록 조회
	@RequestMapping("findOrder")
	@ResponseBody
	public List<SalesVO> findOrder(SalesVO vo) {
		return salesService.findOrder(vo);
	}
}
