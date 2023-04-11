package com.yedam.dubu.material.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.dubu.material.mapper.MaterialMapper;
import com.yedam.dubu.material.service.MaterialService;
import com.yedam.dubu.material.service.MaterialVO;

@Service
public class MaterialServiceImpl implements MaterialService{
	
	@Autowired
	MaterialMapper materialMapper;

	// 자재 검색 모달
	@Override
	public List<MaterialVO> getMaterialModal() {
		return materialMapper.getMaterialModal();
	}
	
	// 업체 검색 모달
	@Override
	public List<MaterialVO> getVendModal() {
		return materialMapper.getVendModal();
	}
	
	// 자재 목록
	@Override
	public List<MaterialVO> getMaterialList(MaterialVO materialVO) {
		return materialMapper.getMaterialList(materialVO);
	}

	// 다음에 오는 발주코드
	@Override
	public MaterialVO getNextMaterialOrderCode() {
		return materialMapper.getNextMaterialOrderCode();
	}

	// 자재발주 INSERT
	@Override
	public int getMaterialOrderInsert(MaterialVO material) {
		return materialMapper.getMaterialOrderInsert(material);
	}

	// 자재발주디테일 INSERT
	@Override
	public int getMaterialOrderDetailInsert(MaterialVO material) {
		return materialMapper.getMaterialOrderDetailInsert(material);
	}

	/* 자재 발주 조회 페이지 */
	// 자재 발주 조회
	@Override
	public List<MaterialVO> getMaterialOrderList(MaterialVO materialVO) {
		return materialMapper.getMaterialOrderList(materialVO);
	}
	
	// 자재 발주 상세 리스트
	@Override
	public List<MaterialVO> getMaterialOrderListDetail(String ordrCd) {
		return materialMapper.getMaterialOrderListDetail(ordrCd);
	}

	@Override
	public int getMaterialOrderListDetailModify(MaterialVO materialVO) {
		return materialMapper.getMaterialOrderListDetailModify(materialVO);
	}

}
