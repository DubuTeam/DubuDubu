package com.yedam.dubu.material.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String getMaterialOrder(Model model, MaterialVO materialVO) {
		model.addAttribute("materialModalList",materialService.getMaterialModal()); // 자재명 모달창
		model.addAttribute("vendMoalList",materialService.getVendModal()); // 업체명 모달창
		model.addAttribute("materialList", materialService.getMaterialList(materialVO)); // 자재 목록
		//model.addAttribute("materialOrderList", materialService.getMaterialOrderList()); // 자재 발주 리스트
		model.addAttribute("OrderCode", materialService.getNextMaterialOrderCode().getOrdrCd()); // 다음에 오는 발주코드
		return "material/materialOrder";
	}
	
	// 자재 조회(자재명, 업체명)
	@GetMapping("/searchMaterialOrder")
	@ResponseBody
	public Map<String, Object> getSearchMaterialOrder(MaterialVO materialVO) {
		System.out.println(materialVO);
		Map<String, Object> map = new HashMap<>();
		map.put("result", materialService.getMaterialList(materialVO));
		return map;
	}

	// 자재발주 insert
	@PostMapping("/materialOrderInsert")
	@ResponseBody // ★★무조건 JSON타입만 return 할수있는것이 아님 여러 data타입들을 return 할 수 있음★★ 
	public int postMaterialOrderInsert(MaterialVO materialVO) { 

		String[] rscCd = materialVO.getRscCd().split(","); // 자재코드
		String[] ordrCd = materialVO.getOrdrCd().split(","); // 발주코드
		String[] ordrCnt = materialVO.getOrdrCnt2().split(","); // 발주수량
		String[] paprdCmndDt = materialVO.getPaprdCmndDt2().split(","); // 납기요청일
		String[] vendCd = materialVO.getVendCd().split(","); // 거래처코드
		
		String nextOrdrCd = materialService.getNextMaterialOrderCode().getOrdrCd(); // 다음에 오는 발주코드
	
		MaterialVO material = new MaterialVO();
	
		int r = 0;
		
		material.setOrdrCd(ordrCd[0]); // 발주코드
		material.setVendCd(vendCd[0]); // 거래처코드
		r = materialService.getMaterialOrderInsert(material); // 발주 insert
		
		for(int i = 0 ; i < rscCd.length; i++) {
			material.setRscCd(rscCd[i]); // 자재코드
			//material.setOrdrCd(ordrCd[i]); // 발주코드
			material.setOrdrCnt(Integer.parseInt(ordrCnt[i])); // 발주수량
			material.setRmnCnt(Integer.parseInt(ordrCnt[i])); // 미입고잔량 = 발주수량
			material.setPaprdCmndDt2(paprdCmndDt[i]); // 납기요청일
			//material.setVendCd(vendCd[i]); // 거래처코드
			
			r = materialService.getMaterialOrderDetailInsert(material); // 발주 디테일 insert 
			System.out.println(material);
		}
		return r;
	}
	 
	// 자재발주조회 페이지 => 없어도됨
	@GetMapping("/materialOrderSearch")
	public String getMaterialOrderSearch(Model model) {
		model.addAttribute("vendMoalList",materialService.getVendModal()); // 업체명 모달창
		return "material/materialOrderSearch";
	}
	
	// 자재발주한 목록들 받아오기 => 없어오됨
	@PostMapping("/materialOrderSearch")
	@ResponseBody
	public List<MaterialVO> getMaterialOrderList(MaterialVO materialVO){
		//System.out.println(materialVO.getStartOrdrReqDt());
		//System.out.println(materialVO.getEndOrdrReqDt());
		return materialService.getMaterialOrderList(materialVO);
	}
	
	// 그리드 셀 더블클릭시 나타나는 자재 발주 상세 디테일 정보들
	@PostMapping("/materialDetail")
	@ResponseBody
	public List<MaterialVO> getMaterialOrderDetail(MaterialVO materialVO){
		return materialService.getMaterialOrderListDetail(materialVO.getOrdrCd());
	}
	
	// 자재 발주 상세 디테일 수정
	@PostMapping("/materialDetailModify")
	@ResponseBody
	public List<MaterialVO> getMaterialOrderDetailModify(MaterialVO materialVO){
		
		String ordrCd = materialVO.getOrdrCd(); // 발주코드
		String[] rscCd = materialVO.getRscCd().split(","); // 자재코드
		String[] ordrCnt = materialVO.getOrdrCnt2().split(","); // 발주수량
		String[] paprdCmndDt = materialVO.getPaprdCmndDt2().split(","); // 납기요청일
		
		int r = 0;
		
		MaterialVO material = new MaterialVO();
		
		for(int i = 0 ; i < rscCd.length; i++) {
			material.setOrdrCd(ordrCd); // 발주코드
			material.setRscCd(rscCd[i]); // 자재코드
			material.setOrdrCnt(Integer.parseInt(ordrCnt[i])); // 발주수량
			material.setRmnCnt(Integer.parseInt(ordrCnt[i])); // 미입고잔량
			material.setPaprdCmndDt2(paprdCmndDt[i]); // 납기 요청일
			r = materialService.getMaterialOrderListDetailModify(material); // 자재 발주 디테일 수정
		}
		
		if(r > 0) {
			return materialService.getMaterialOrderListDetail(ordrCd); // 수정한 리스트 다시 반환	
		}else {
			return null;
		}
		
	}
	
	// 자재 발주 삭제 => 자주발주상세는 트리거를 이용하여 삭제함 MaterialMapper.xml에 적어놓음
	@PostMapping("/materialOrderDelete")
	@ResponseBody
	public int getMaterialOrderDelete(MaterialVO materialVO){
		
		String[] ordrCd = materialVO.getOrdrCd().split(",");
		int r = 0;
		
		for(int i=0; i < ordrCd.length; i++) {
			r = materialService.getMaterialOrderDelete(ordrCd[i]);
		}
		return r;
	}
	
	// 자재 발주 상세 자재 삭제
	@PostMapping("/materialOrderDetailDelete")
	@ResponseBody
	public int getMaterialOrderDetailDelete(MaterialVO materialVO) {
		
		String ordrCd = materialVO.getOrdrCd();
		String[] rscCd = materialVO.getRscCd().split(",");
		
		int r = 0;
		MaterialVO material = new MaterialVO();
		
		for(int i = 0; i < rscCd.length; i++) {
			material.setOrdrCd(ordrCd);
			material.setRscCd(rscCd[i]);
			r = materialService.getDeleteProcedure(material);
		}
		return r;
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
