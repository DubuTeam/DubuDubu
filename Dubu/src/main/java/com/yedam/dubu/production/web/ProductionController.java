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
	 @ResponseBody 
	 public List<ProductionVO> getOrderList(@RequestParam(required=false) String orderNo) { 
		 return productionService.selectOrderList(orderNo); }
	 
	 // 생산계획 주문서 디테일 조회
	 @PostMapping("/planOrderDetail")
	 @ResponseBody 
	 public List<ProductionVO> getOrderDetail(ProductionVO productVO) {
		 return productionService.orderDetailGrid(productVO.getOrderNo());
	 }
	 // 생산계획 계획코드 부여
	 @PostMapping("/updatePlan")
	 @ResponseBody
	 public int updatePlan(@RequestBody List<ProductionVO> insertPlan) {
		 productionService.insertIndica(insertPlan);
		 return productionService.updatePlan(insertPlan);
	 }
		
		 // 생산계획 새로운 계획
		 @PostMapping("/insertPlan")		  
		 @ResponseBody 
		 public int insertPlan(@RequestBody ProductionVO productionVO){
		 return productionService.insertPlan(productionVO.getCreatedRows(), productionVO.getCreatedRows());
		 }
		 
	// 생산계획 제품 조회
	 @PostMapping("/selectPlanEquip")
	 @ResponseBody List<ProductionVO> getPlanEquip(ProductionVO productionVO){
		 return productionService.selectPlanEquip(productionVO.getOrderNo());
	 }
	 
	// 생산계획 사용가능자재 조회
	 @PostMapping("/selectPlanMaterial")
	 @ResponseBody List<ProductionVO> getPlanMaterial(ProductionVO productionVO){
		 System.out.println(productionVO.getBomCd());
		 return productionService.selectPlanMaterial(productionVO.getBomCd());
	 } 
	 
	// 생산계획 제품공정확인 조회
	 @PostMapping("/selectPlanEquipCheck")	  
	 @ResponseBody List<ProductionVO> getEquipCheck(ProductionVO productionVO){ 
		 return productionService.planEquipCheck(productionVO.getPrdtNm()); 
		 }
	 

		/*
		 * // 생산계획 자재확인 조회
		 * 
		 * @PostMapping("/selectPlanMaterialCheck")
		 * 
		 * @ResponseBody List<ProductionVO> getMaterialCheck(@RequestParam(required =
		 * false) String prcLotCd){ return
		 * productionService.planMaterialCheck(prcLotCd); }
		 */
	// 생산지시
	@GetMapping("/indica")
	public String getIndica(Model model){
		return "production/indica";
	}
	// 생산지시 계획 조회
	@PostMapping("/indicaOrderList")
	@ResponseBody List<ProductionVO> getIndicaOrder(@RequestParam(required = false)String planCd){
		return productionService.selectIndicaOrder(planCd);
	}
	
	// 생산지시 계획 디테일
	@PostMapping("/indicaOrderDetail")
	@ResponseBody List<ProductionVO> getIndicaOrderDetail(@RequestParam(required=false)String planCd){
		return productionService.selectIndicaOrderDetail(planCd);
	}
	
	// 생산지시조회
	@GetMapping("/indicaSearch")
	public String getIndicaSearch(Model model){
		return "production/indicaSearch";
	}
	// 생산지시 등록
//	@PostMapping("/insertIc")
//	@ResponseBody void getInsertIndica(@RequestBody ProductionVO productionVO) {
//		
//	};
	
	

		
	// 공정실적조회
	@GetMapping("/prcsSearch")
	public String getPrcsSearch(Model model){
		return "production/prcsSearch";
	}
	
}
