package com.yedam.dubu.quality.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.quality.service.QualityService;
import com.yedam.dubu.quality.service.QualityVO;
import com.yedam.dubu.quality.service.RscInspVO;

@Controller
public class QualityController {

	@Autowired
	QualityService qualityService;
	
	// 제품검사관리
	@GetMapping("/prdtInsp")
	public String getPrdtInsp(Model model) {
		model.addAttribute("getPrdtInsp",qualityService.selectQualityList());
		return "quality/prdtInsp";
	}
	

	@PostMapping("/prdtInsp")
	@ResponseBody
	public List<QualityVO>PrdtInsp2(QualityVO qualityVO) {

		return null;
	}
	
	// 자재입고검사관리
	@GetMapping("/materialInsp")
	public String getMaterialInsp(Model model) {
		return "quality/materialInsp";
	}
	//조회
	@RequestMapping("getPrdtInsp")
	@ResponseBody
	public List<QualityVO> getPrdtInsp(QualityVO qualityVO) {
		return qualityService.getPrdtInsp(qualityVO);
	}

	@RequestMapping("getPrdtInspDtl")
	@ResponseBody
	public List<QualityVO> getPrdtInspDtl(QualityVO qualityVO) {
		return qualityService.getPrdtInspDtl(qualityVO);
	}
	
	 // search conditions
    @RequestMapping("getVendors")
    @ResponseBody
    public List<QualityVO> getMatVendList(@ModelAttribute QualityVO qualityVO) {
    	System.out.println(qualityService.getMatVendList(qualityVO));
        return qualityService.getMatVendList(qualityVO);
    }
    
    
    /*
    @RequestMapping("getResources")
    @ResponseBody
    public List<QualityVO> getResources(@ModelAttribute QualityVO qualityVO) {
        return qualityService.getResources(qualityVO);
    }*/

    //검사내역 저장
    @RequestMapping("getRscOrdrList")
    @ResponseBody
    public List<QualityVO> getRscOrdrList(QualityVO qualityVO) {
        return qualityService.getMatOrdrList(qualityVO);
    }
    @RequestMapping("setRscInspList")
    @ResponseBody
    public void setRscInspList(@RequestBody List<RscInspVO> rscInspVOS) {
    	qualityService.setRscInspList(rscInspVOS);
    }
    
    // 검사상세
    @RequestMapping("getInfCdList")
    @ResponseBody
    public List<QualityVO> getInfCdList() {
        return qualityService.getInfCdList();
    }
	
    @RequestMapping("schRscInspHist")
    @ResponseBody
    public List<RscInspVO> schRscInspHist(@ModelAttribute RscInspVO rscInspVO) {
        return qualityService.schRscInspHist(rscInspVO);
    }

     @PostMapping("/upRscProg")
      public void upRscProg(@RequestBody RscInspVO rscInspVO) {
        qualityService.upRscProg(rscInspVO);
      }
    
}
