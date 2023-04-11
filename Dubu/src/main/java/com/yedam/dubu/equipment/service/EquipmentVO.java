package com.yedam.dubu.equipment.service;

import lombok.Data;

@Data
public class EquipmentVO {
	// 설비라인 테이블 (EQM_LINE 테이블)
	private String lineCd;			// 라인코드
	private String lineNm;			// 라인명
	private String eqmPsch;			// 라인 담당자
	private int uphCnt;				// UPH 생산량
	private String useYn;			// 사용 여부
	
	
	///////////////////////////////////////////////
	
	
	// 2. 설비 관리 테이블 (EQM 테이블)
	
	// 2-1. 설비 구분 탭에서 쓸 것  -  공통 코드 테이블 (CCDS 테이블)
	 private String ccd;
	 private String ccdNm;
	
	// 2-2. 라인 탭에서 쓸 것	(-> 이건 그냥 위의 lineNm 쓰면 됨)
	
	// 2-3. 공정명 탭에서 쓸 것	(ProductionVO.java 에서 변수명 prcsNm 그냥 가져옴 -> 어차피 Mapper 에서 써서 담는거라 괜찮..?)
	// 이것들을 쓰기 위해서는 Mapper, Service, Controller 에다가 얘들을 위한 코드를 싹 다 추가해줘야 함
	public String prcsCd;	// 공정코드
	public String prcsNm;	// 공정명
	

	
	// 2-4. 설비 등록시 테이블에 출력할 컬럼들 (위에 존재하는 것들은 제외하고, 새로 추가함) - 입고일자랑 설비구분은 일부러 안 넣음 (어차피 안 쓴다)
	private int idx;
	private String eqmNm;
	private String eqmCd;
	private String eqmYn;
	private int minTemp;
	private int maxTemp;
	private int chckPerd;
}