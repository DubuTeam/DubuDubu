package com.yedam.dubu.quality.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QualityVO {
	/*
	 * private String edctsLotNo; //완제품 Lot번호 private String orderNo; // 주문번호
	 * private String edctsCd; //완제품코드 private String prdt_nm; //제품명 private String
	 * inspJm; //최종판정 private Date inspDt; //검사일자 private String inspPsch; //검사담당자
	 * 
	 * private Date startDt; private Date endDt;
	 */
	
	
	
	String edctsLotNo;  //LOT번호
	String edctsCd;     //
	String orderNo;     //주문서 번호
	String inspPsch;	//
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date inspDt;
	Integer inspCnt;
	String inspJm;
	
	
	String inspCd;	
	String inspNm;
	String inspSd;	
	String inspRsltDtl;
	String inspJmDtl;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date startDt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date endDt;
	
	
	String edctsNm;
	
	String prdtNm;
	
	
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
		private int avalStc; // 현재재고
		
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
		
		// 자재발주 디테일
		private int ordrCnt; // 발주량
		private String ordrCnt2; // 발주량 String
		private int rmnCnt; // 미입고 잔량
		
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date paprdCmndDt; // 납기요청일
		private String paprdCmndDt2; // 납기요청일 String
		
		// 별칭
		private int expect; // 자재발주시 예상재고량
	
	
}
