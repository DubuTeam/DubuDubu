package com.yedam.dubu.production.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.production.mapper.ProductionMapper;
import com.yedam.dubu.production.service.ProductionService;
import com.yedam.dubu.production.service.ProductionVO;

@Service
public class ProductionServiceImpl implements ProductionService {

	
	@Autowired
	ProductionMapper productionMapper;

	@Override
	public List<ProductionVO> selectPrcList() {
		return productionMapper.selectPrcList();
	}

	@Override
	public List<ProductionVO> getPrcsGrid(String prcsDiv) {
		return productionMapper.selectPrcsGrid(prcsDiv);
	}

	@Override
	public int deletePrcsGird(String prcsCd) {
		 String[] array = prcsCd.split(",");
		 int result = 0;
		 
		   for(int i=0; i<array.length; i++) {
		         result = productionMapper.deletePrcsGrid(array[i]);
		      }
		    if(result > 0) {
		         return result;
		      } else {
		         return -1;
		      }
		   }
	



	@Override
	public String inesrtPrcsCode() {
		return productionMapper.inesrtPrcsCode();
	}

	@Override
	public int insertPrcsGrid(List<ProductionVO> list) {
		int result = 0;
		for(ProductionVO vo : list) {
			result += productionMapper.insertPrcsGrid(vo);
		}
		return result;
	}

	@Override
	public int updatePrcsGrid(List<ProductionVO> update) {
		int result = 0;
		for(ProductionVO vo : update) {
			result += productionMapper.updatePrcsGrid(vo);
		}
		return result;
	}

	/*
	 * @Override public List<ProductionVO> selectOrderList() { return
	 * productionMapper.selectOrderList(); }
	 */

	
	  @Override public List<ProductionVO> selectOrderList(String orderNo) { 
		  return productionMapper.selectOrderList(orderNo);
		  }

	@Override
	public List<ProductionVO> orderDetailGrid(String orderNo) {
		ProductionVO productionVO = new ProductionVO();
		productionVO.setOrderNo(orderNo);
		 
		 List<ProductionVO> list = new ArrayList<>();
		list = productionMapper.orderDetailGrid(productionVO);
	
		return list;
	}



	@Override
	public List<ProductionVO> selectPlanEquip(String orderNo) {
		 
		ProductionVO productionVO = new ProductionVO();
		productionVO.setOrderNo(orderNo);
		
		List<ProductionVO> list = new ArrayList<>();
		list = productionMapper.selectPlanEquip(productionVO);
	
		return list;
	}

	@Override
	public List<ProductionVO> selectPlanMaterial(String bomCd) {
		 
		ProductionVO productionVO = new ProductionVO();
		productionVO.setBomCd(bomCd);
		
		List<ProductionVO> list = new ArrayList<>();
		list = productionMapper.selectPlanMaterial(productionVO);
	
		return list;
	}

	@Override
	public List<ProductionVO> planEquipCheck(String prdtNm) {
		return productionMapper.planEquipCheck(prdtNm);
	}

	@Override
	public int updatePlan(List<ProductionVO> insertPlan) {	
		int result = 0;
		String plancd = productionMapper.planCode(); // 계획코드를 주문서 테이블에 업데이트 할 
		for(ProductionVO vo : insertPlan) {
			vo.setPlanCd(plancd);
			result += productionMapper.insertPlan(vo);
			result += productionMapper.updatePlanCode(vo);
		}
		return result;
	}

	@Override
	public List<ProductionVO> selectIndicaOrder(String planCd) {
		return productionMapper.selectIndicaOrder(planCd);
	}

	@Override
	public int insertPlan(List<ProductionVO> name, List<ProductionVO> cnt) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductionVO> selectIndicaOrderDetail(String planCd) {
		return productionMapper.selectIndicaOrderDetail(planCd);
	}

	/*
	 * @Override public List<ProductionVO> planMaterialCheck(String prcLotCd) {
	 * return productionMapper.planMaterialCheck(prcLotCd); }
	 */








}
	 





