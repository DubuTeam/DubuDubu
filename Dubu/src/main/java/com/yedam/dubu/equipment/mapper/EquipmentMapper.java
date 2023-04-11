package com.yedam.dubu.equipment.mapper;

import java.util.List;

import com.yedam.dubu.equipment.service.EquipmentVO;

public interface EquipmentMapper {

		// <<< 설비 라인 페이지 >>>
	

		// 전체 조회
		public List<EquipmentVO> selectAllEquipmentLineList();


		// 자동으로 부여될 라인코드
		public String getLineCode();
		

		// 등록	(나는 지금 form 태그랑 뷰 페이지랑 같이 있어서, 따로 뷰 페이지 만들 필요 없을 듯)
		public int insertEquipmentLine(EquipmentVO equipmentVO);
		
		
		// 수정	(나는 지금 form 태그랑 뷰 페이지랑 같이 있어서, 따로 뷰 페이지 만들 필요 없을 듯)
		public int updateEquipmentLine(EquipmentVO equipmentVO);
		
		
		// 삭제
		public int deleteEquipmentLine(EquipmentVO equipmentVO);
		
		
		/////////////////////////////////////////////////////////////////////////
		
		
		// <<< 설비 관리 페이지 >>>
		
		
		// 설비관리 테이블
		// 공정명, 공정코드 가져오기 위한 것.
		public List<EquipmentVO> selectAllProcessList();
		
		
		// 공통코드 테이블 (CCDS)
		// 설비구분 탭의 설비구분 코드 및 설비코드 가져오기 위함.
		public List<EquipmentVO> selectAllCommonDataList();
		
		
		///////////////////////////////////////////
		
		
		// 설비 목록 출력하기
		public List<EquipmentVO> selectAllEquipmentList();
		
		// 설비 등록하기
		public int insertEquipment(EquipmentVO equipmentVO);
}