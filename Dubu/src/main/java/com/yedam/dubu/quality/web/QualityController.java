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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.quality.mapper.QualityMapper;
import com.yedam.dubu.quality.service.QualityService;
import com.yedam.dubu.quality.service.QualityVO;
import com.yedam.dubu.quality.service.RscInfVO;
import com.yedam.dubu.quality.service.RscInspVO;

@Controller
public class QualityController {

	@Autowired
	QualityService qualityService;
	@Autowired
	 QualityMapper qualityMapper;

	// 제품검사관리
	@GetMapping("/prdtInsp")
	public String getPrdtInsp(Model model) {
		model.addAttribute("getPrdtInsp", qualityService.selectQualityList());
		return "quality/prdtInsp";
	}

	@PostMapping("/prdtInsp")
	@ResponseBody
	public List<QualityVO> PrdtInsp2(QualityVO qualityVO) {

		return null;
	}

	// 자재입고검사관리
	@GetMapping("/materialInsp")
	public String getMaterialInsp(Model model) {
		return "quality/materialInsp";
	}

	// 조회
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
	 * @RequestMapping("getResources")
	 * 
	 * @ResponseBody public List<QualityVO> getResources(@ModelAttribute QualityVO
	 * qualityVO) { return qualityService.getResources(qualityVO); }
	 */

	// 검사내역 저장
	@RequestMapping("getRscOrdrList")
	@ResponseBody
	public List<QualityVO> getRscOrdrList(QualityVO qualityVO) {
		return qualityService.getMatOrdrList(qualityVO);
	}

	
	// 자재검사 등록 INSERT 인서트
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

	//업뎃
	/*
	 * @PostMapping("upRscProg") public void upRscProg(@RequestBody RscInspVO
	 * rscInspVO) { qualityService.upRscProg(rscInspVO); }
	 */

	 @PostMapping("/upRscProg")
	    @ResponseBody
	    public int upRscProg(@RequestBody List<RscInspVO> rscInspVO) {
	        return qualityService.upRscProg(rscInspVO);
	    }
	   
    
    
	//삭제
	@RequestMapping("delRscInspHist")
	@ResponseBody
	public void delRscInspHist(@RequestBody List<RscInspVO> rscInspVOS) {
		qualityService.delRscInspHistAll(rscInspVOS);
	}
	
	// 테스트 - 담당자 모달 내 직원 목록 출력
	@GetMapping("/empList")
    public String getEmpList(Model model) {
        List<RscInfVO> rscInfVOList = qualityService.selectAllEmpListInModal();
        model.addAttribute("empListInModal", rscInfVOList);
        return "quality/materialInsp";
    }

}
