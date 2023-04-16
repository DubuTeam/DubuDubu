package com.yedam.dubu.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialVO {
	
	// 자재정보 테이블
	private String rscCd; // 자재코드
	private String vendCd; // 거래처코드 fk
	private String rscNm; // 자재명 
	private String rscSpec; // 자재규격 
	private String mngUnit; // 자재단위 
	private String rscTyp; // 자재유형
	private int safStc; // 안전재고 		
	private String userYn; // 사용여부
	
	// 자재재고테이블
	private int rscStc; // 자재 재고 수량
	private int avalStc; // 재고 가용 수량
	
	// 거래처 테이블
	private String vendNm; // 거래처명
	private String binzo; // 사업자 등록번호 
	private String telno; // 거래처 전화번호
	
	// 자재를 발주한 정보를 저장하는 테이블
	private String ordrCd; // 발주번호(발주코드)
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ordrReqDt; // 발주신청일
	private String ordrReqDt2; // 발주신청일 String
	private String startOrdrReqDt; // 발주 신청일 start
	private String endOrdrReqDt; // 발주 신청일 end
	private String rscProgress; // 발주 진행사항
	
	// 자재발주 디테일
	private String ordrDtlCd; // 자재 상세코드
	private int ordrCnt; // 발주량
	private String ordrCnt2; // 발주량 String
	private int rmnCnt; // 미입고 잔량
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date paprdCmndDt; // 납기요청일
	private String paprdCmndDt2; // 납기요청일 String
	
	// 별칭
	private int expect; // 자재발주시 예상재고량
	
	// 자재 검사 상세 테이블
	private String inspCd; // 자재 검사 코드(번호)
	private String istCheck; // 입고여부 'Y', 'N'
	private int inspPassCnt; // 입고 가능 수량 (합격수량) 
	
	
	// 자재 입고 테이블
	private String istCd; // 입고 코드
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date istDt; // 입고 일자 
	private int istCnt; // 입고수량
	
	// 자재 LOT 테이블
	private String prcLotCd; // 자재 LOT 코드
	private int lotCnt; // 자재 LOT 등록 수량
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date expDt; // 유통기한
	private String expDt2; // 유통기한
	
	
}
