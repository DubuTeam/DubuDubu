package com.yedam.dubu.performpro.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
    // 생산지시 디테일 리스트(생산할 제품 목록)
    @PostMapping("/prodList")
    @ResponseBody 
    public List<PerformproVO> getprodList(@RequestParam String indicaCd){ 
	  return performproService.getProdList(indicaCd); 
    }
    
    // 한 제품의 생산 공정 흐름
    @PostMapping("/processFlow")
    @ResponseBody 
    public List<PerformproVO> getProcessFlow(@RequestParam String prodOrderDetailCd){
    	return performproService.getProcessFlow(prodOrderDetailCd);
    }
    
	// 한 공정에 들어가는 설비
    @PostMapping("/getEqm")
    @ResponseBody 
    public List<PerformproVO> getEqm(@RequestParam String prcsCd){
    	return performproService.getEqm(prcsCd);
    }
    
    // 한 공정에 필요한 자재
    @PostMapping("/getRsc")
    @ResponseBody 
    public List<PerformproVO> getRsc(PerformproVO performproVO){
    	return performproService.getRsc(performproVO);
    }
    
	 
	
}
