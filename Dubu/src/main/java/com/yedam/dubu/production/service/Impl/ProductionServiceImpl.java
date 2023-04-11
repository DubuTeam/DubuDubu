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
		String[] array = orderNo.split(",");
		 
		 List<ProductionVO> list = new ArrayList<>();
		list = productionMapper.orderDetailGrid(array);
	
		return list;
	}

	@Override
	public int updatePlan(List<ProductionVO> updatePlan) {
	//public int updatePlan(List<ProductionVO> updatePlanCd, List<ProductionVO> updatePlanYn) {
		int result = 0;
		for(ProductionVO vo : updatePlan) {
				result += productionMapper.updatePlan(vo);
			}
		//for(ProductionVO vo : updatePlanCd) {
		//	result += productionMapper.updatePlanCd(vo);
		//}
		//for(ProductionVO vo : updatePlanYn) {
		//	result += productionMapper.updatePlanYn(vo);
		//}
		return result;
	}

}
	 





