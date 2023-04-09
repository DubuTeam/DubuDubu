package com.yedam.dubu.material.web;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.dubu.material.service.MaterialService;
import com.yedam.dubu.material.service.MaterialVO;

@Controller
public class MaterialController {
	@Autowired
	MaterialService materialService;

	// 자재발주(모달)
	@GetMapping("/materialOrderAdd")
	public String getMaterialOrderAdd(Model model) {
		return "material/materialOrderAdd";
	}

	// 자재발주
	@GetMapping("/materialOrder")
	public String getMaterialOrder(Model model) {
		model.addAttribute("materialList", materialService.getMaterialList()); // 자재 목록
		model.addAttribute("materialOrderList", materialService.getMaterialOrderList()); // 자재 발주 리스트
		model.addAttribute("OrderCode", materialService.getNextMaterialOrderCode().getOrdrCd()); // 다음에 오는 발주코드
		return "material/materialOrder";
	}

	// 자재발주 insert , update, delete
	@PostMapping("/materialOrder")
	@ResponseBody // ★★무조건 JSON타입만 return 할수있는것이 아님 여러 data타입들을 return 할 수 있음★★ 
	public int postMaterialOrder(MaterialVO materialVO) throws ParseException { 
		int r = 0;
		if(materialVO.getParam().equals("insert")) {
			String[] rscCd = materialVO.getRscCd().split(","); // 자재코드
			String[] ordrCd = materialVO.getOrdrCd().split(","); // 발주코드
			String[] ordrCnt = materialVO.getOrdrCnt2().split(","); // 발주수량
			String[] paprdCmndDt = materialVO.getPaprdCmndDt2().split(","); // 납기요청일
			
			MaterialVO material = new MaterialVO();
			for(int i = 0 ; i < rscCd.length; i++) {
				material.setRscCd(rscCd[i]); // 자재코드
				material.setOrdrCd(ordrCd[i]); // 발주코드
				material.setOrdrCnt(Integer.parseInt(ordrCnt[i])); // 발주수량
				material.setPaprdCmndDt2(paprdCmndDt[i]); // 납기요청일
				r = materialService.getMaterialOrderInsert(material); // 발주 insert
			}
			return r;
		}else if(materialVO.getParam().equals("update")) {
			return r;
		}else {
			return r;
		}
	}
	 

	// 자재발주조회
	@GetMapping("/materialOrderSearch")
	public String getMaterialOrderSearch(Model model) {
		return "material/materialOrderSearch";
	}

	// 자재입고검사조회
	@GetMapping("/materialInspList")
	public String getMaterialInspList(Model model) {
		return "material/materialInspList";
	}

	// 자재입고관리
	@GetMapping("/materialIst")
	public String getMaterialIist(Model model) {
		return "material/materialIst";
	}

	// 자재입고조회
	@GetMapping("/materialIstList")
	public String getMaterialIstList(Model model) {
		return "material/materialIstList";
	}

	// 원자재출고관리
	@GetMapping("/materialOust")
	public String getMaterialOust(Model model) {
		return "material/materialOust";
	}

	// 원자재출고조회
	@GetMapping("/materialOustList")
	public String getMaterialOustList(Model model) {
		return "material/materialOustList";
	}

	// 자재재고조회
	@GetMapping("/materialStcList")
	public String getMaterialStcList(Model model) {
		return "material/materialStcList";
	}

	// 자재LOT재고조회
	@GetMapping("/materialLOTList")
	public String getMaterialLOTList(Model model) {
		return "material/materialLotList";
	}

	// 자재입/출고조회
	@GetMapping("/materialIOList")
	public String getMaterialIOList(Model model) {
		return "material/materialIOList";
	}

}
