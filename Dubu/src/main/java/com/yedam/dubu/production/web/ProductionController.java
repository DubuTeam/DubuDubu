package com.yedam.dubu.production.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.production.service.ProductionService;
import com.yedam.dubu.production.service.ProductionVO;

@Controller
public class ProductionController {

	@Autowired
	ProductionService productionService;
	
	// 제품공정흐름관리
	@GetMapping("/prcProcess")
	public String getprcProcessg(Model model){
		return "production/prcProcess";
	}
	
	// 공정관리
	@GetMapping("/prcs")
	public String getPrcs(Model model){
		model.addAttribute("selectPrcList", productionService.selectPrcList());
		return "production/prcs";
	}
	// 공정관리 - 그리드로 조회
	@PostMapping("/prcs")
	@ResponseBody
	public List<ProductionVO> getPrcsGrid(@RequestParam(required=false) String prcsDiv) {
		return productionService.getPrcsGrid(prcsDiv);
	}
	// 공정관리 - 그리드로 삭제
	@PostMapping("/deletePrcs")
	@ResponseBody
	public int deletePrcsGrid(@RequestParam String prcsCd) {
		return productionService.deletePrcsGird(prcsCd);
	}
	// 공정관리 - 그리드로 추가
	@PostMapping("/insertPrcs")
	@ResponseBody
	public int insertPrcsGrid(@RequestBody ProductionVO productionVO) {
		
		
		return productionService.insertPrcsGrid(productionVO.getCreatedRows());
	}
	// 공정관리 - 그리드로 수정
	@PostMapping("/updatePrcs")
	@ResponseBody
	public int updatePrcsGrid(@RequestBody ProductionVO productionVO) {
		
		
		return productionService.updatePrcsGrid(productionVO.getUpdatedRows());
	}
	
	// 생산계획
	@GetMapping("/plan")
	public String getPlan(Model model){
		//model.addAttribute("selectOrderList", productionService.selectOrderList());
		return "production/plan";
	}
	
	// 생산계획 조회
	@GetMapping("/planSearch")
	public String getPlanSearch(Model model){
		return "production/planSearch";
	}
	
	
	  // 생산계획 주문서 조회	  
	  @PostMapping("/planOrderList")	  
	  @ResponseBody public List<ProductionVO>
	  getOrderList(@RequestParam(required=false) String orderNo) { return
	  productionService.selectOrderList(orderNo); }
	 
	
	
	// 생산지시
	@GetMapping("/indica")
	public String getIndica(Model model){
		return "production/indica";
	}
	
	// 생산지시조회
	@GetMapping("/indicaSearch")
	public String getIndicaSearch(Model model){
		return "production/indicaSearch";
	}
	
	// 공정실적조회
	@GetMapping("/prcsSearch")
	public String getPrcsSearch(Model model){
		return "production/prcsSearch";
	}
	
	// 생산관리
	@GetMapping("/progMng")
	public String getprogMng(Model model){
		return "production/progMng";
	}
}
