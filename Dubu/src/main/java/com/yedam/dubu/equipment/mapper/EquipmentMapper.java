package com.yedam.dubu.equipment.mapper;

import java.util.List;

import com.yedam.dubu.equipment.service.EquipmentVO;

public interface EquipmentMapper {

		// 전체 조회
		public List<EquipmentVO> selectAllEquipmentList();


		// 자동으로 부여될 라인코드
		public String getLineCode();
		

		// 등록	(나는 지금 form 태그랑 뷰 페이지랑 같이 있어서, 따로 뷰 페이지 만들 필요 없을 듯)
		public int insertEquipment(EquipmentVO equipmentVO);
		
		
		// 수정	(나는 지금 form 태그랑 뷰 페이지랑 같이 있어서, 따로 뷰 페이지 만들 필요 없을 듯)
		public int updateEquipment(EquipmentVO equipmentVO);
		
		
		// 삭제
		public int deleteEquipment(EquipmentVO equipmentVO);
		
		
		/////////////////////////////////////////////////////////////////////////
		
		
		// 설비관리 테이블
		
		// 공정명, 공정코드 가져오기 위한 것.
		public List<EquipmentVO> selectAllProcessList();
}