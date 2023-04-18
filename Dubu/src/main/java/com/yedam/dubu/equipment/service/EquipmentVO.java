package com.yedam.dubu.equipment.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EquipmentVO {
	// 1. 설비라인 테이블 (EQM_LINE 테이블)
	private String lineCd;			// 라인코드
	private String lineNm;			// 라인명
	private String linePsch;			// 라인 담당자
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
	private int idx;		// SQL 에서의 ROWNUM 값을 받을 변수
	private String eqmNm;
	private String eqmCd;
	private String eqmYn;
	private int minTemp;
	private int maxTemp;
	private int chckPerd;
	private String eqmFg;						// 설비 구분
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date eqmIstDt;
	
	
	//2-5. 검색 기능 시 필요한 변수명
	private String searchType;			// 검색 시, 어떤 걸 기준으로 검색하는지 (설비명, 설비코드, 공정명)
	private String keyword;				// 검색창에 입력한 값
	
	
	///////////////////////////////////////////////
	
	
	// 설비점검내역 페이지에서 쓰이는 변수들
	private String chckCd;				// 점검코드
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date chckDt;				// 점검일자
	private String dispoMatter;			// 조치사항
	private String dispoCtnt;			// 조치내역
	private String jdgmnt;				// 판정
	private String chckPsch;			// 점검담당자
	private String chckFg;
	
	
	// 설비점검내역 페이지에서 검색
	private String keyword3;				// 검색 키워드

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date searchFrDt;						// 해당 일자(~부터)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date searchToDt;						// 해당 일자(~까지)
	
	
	///////////////////////////////////////////////
	
	
	// 비가동관리 페이지
	private String noprCd;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date frDt;						// 비가동 시작 일자
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date toDt;						// 비가동 종료 일자
	
	private String eqmPsch;					// 비가동 담당자
	private String opertCtnt;				// 작업내용.   비가동 사유?
}